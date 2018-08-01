//
//  Networkable.swift
//  ESV
//
//  Created by Kushal Ashok on 31/01/2018.
//

import UIKit
import Alamofire
import ObjectMapper
import PKHUD

protocol NetworkTargetType {
    var baseURL: String { get }
    var urlPath: String { get }
    var method: Alamofire.HTTPMethod { get }
    var parameters: [String: AnyObject]? { get }
}

enum NetworkAPI {
    case login(username: String, password:String)
    case getbooks
}

enum CSMessage {
    case success(String)
    case fail(String)
}


extension NetworkAPI: NetworkTargetType {

    var token:String? {
        return UserDefaults.standard.string(forKey: TOKEN)
    }
    
    /// Base URL string
    var baseURL: String {
        switch self {
        default:
            return BASEURL
        }
    }
    
    /// Request URL
    var urlPath: String {
        switch self {
        case .login:
            return baseURL + "api/signin"
        case .getbooks:
            return baseURL + "api/book"
        }
    }
    
    /// Request method
    var method: Alamofire.HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getbooks:
            return .get
        }
    }
 
    /// parameters
    var parameters: [String: AnyObject]? {
        var paramDic = [String:String]()
        switch self {
        case .login(let username, let pass):
            paramDic["username"] = username
            paramDic["password"] = pass
        default:
            return nil
        }
        return paramDic as [String: AnyObject]
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .login:
            return ["Content-Type":"application/x-www-form-urlencoded"]
        case .getbooks:
            return ["Authorization": "\(token ?? "")"]
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .login:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    /// Is print request or not
    var shouldPrintRequest: Bool {
        switch self {
        default:
            return true
        }
    }
    
    
}

protocol Requestable: class {
    func setupNetworkComponentWith<T: Mappable>(netapi: NetworkAPI, mapType: T.Type, mappedObjectHandle: ((_ object: T) -> Void)?, objectArrayHandle:((_ objectArray: [T]) -> Void)?, moreInfo: ((_ message: CSMessage) -> Void)?) -> Request
}

extension Requestable where Self: NSObject {
    
    /// NetworkComponent init
    func setupNetworkComponentWith<T: Mappable>(netapi: NetworkAPI, mapType: T.Type, mappedObjectHandle: ((_ object: T) -> Void )?, objectArrayHandle:((_ objectArray: [T]) -> Void)?, moreInfo: ((_ message: CSMessage) -> Void )?) -> Request {

        if (UIApplication.shared.keyWindow != nil) {
            HUD.show(.progress)
            HUD.hide(afterDelay: 10)
        }

        let request = Alamofire.request(netapi.urlPath, method: netapi.method, parameters: netapi.parameters, encoding: netapi.encoding, headers:netapi.headers ).responseJSON { (response) in
            HUD.hide()
            switch response.result {
            case .success(let value):
                let statusCodeError = self.getStatusCodeError(response.response?.statusCode)
                if let errorString = statusCodeError {
                    moreInfo?(CSMessage.fail(errorString))
                    return
                }
                switch netapi {
                case .login(let username, _):
                    if let responseJSON = value as? [String: Any] {
                        UserDefaults.standard.setValue(responseJSON["token"], forKey: TOKEN)
                        guard let mapObject = Mapper<T>().map(JSON: ["username":username]) else {return}
                        mappedObjectHandle?(mapObject)
                    } else {
                        moreInfo?(CSMessage.fail("Something went wrong"))
                    }
                case .getbooks:
                    guard let responseArray = value as? [[String: Any]] else {return}
                    var objectArray = [T]()
                    for objectJSON in responseArray {
                        if let mapObject = Mapper<T>().map(JSON: objectJSON) {
                            objectArray.append(mapObject)
                        }
                    }
                    objectArrayHandle?(objectArray)
                }
            case .failure(let error):
                moreInfo?(CSMessage.fail(error.localizedDescription))
            }
        }
        if netapi.shouldPrintRequest { request.debugPringRequest() }
        
        return request
    }
    
    
    /// Get error message corresponding to a response code
    ///
    /// - Parameter code: response code
    /// - Returns: Error Message
    func getStatusCodeError(_ code: Int?) -> String? {
        guard let statusCode = code, let httpStatusCode = HTTPStatusCode.init(rawValue: statusCode) else {print("Status code not found"); return nil}
        switch httpStatusCode {
        case .internalServerError:
            return "Internal Server Error"
        case .unauthorized, .forbidden:
            self.navigateToLogin()
            return "Access Issue, try logging in again"
        default:
            return nil
        }
    }
    
    func navigateToLogin() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate, let loginController = R.storyboard.main.loginViewController() {
            delegate.setRoot(loginController)
        }
    }

}

extension Request {
    
    
    /// Print request parameters
    func debugPringRequest() {
        print("-----------------------------------------------------------------------")
        guard let httpBodyData = self.request?.httpBody else { print("request: \( self)"); return }
        guard let parameterString = String(data: httpBodyData, encoding:String.Encoding.utf8) else { print("request: \(self)"); return }
        print("request: \(self)")
        print("parameters: \(parameterString)")
        print("-----------------------------------------------------------------------")
    }
    
    /// get Request parameters
    func getUniqueRequestString() -> String? {
        guard let urlString = self.request?.url?.relativePath else { return nil }
        guard let httpBodyData = self.request?.httpBody else { return urlString }
        guard let parameterString = String(data: httpBodyData, encoding:String.Encoding.utf8) else { return urlString }
        return "\(urlString)?\(parameterString)"
    }
}

