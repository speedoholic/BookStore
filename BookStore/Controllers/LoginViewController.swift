//
//  LoginViewController.swift
//  BookStore
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = realmHelper.getObjects(User.self, filterString: nil)?.first {
            usernameTextField.text = user.username
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - User actions
    
    @IBAction func loginButtonTapped(_ sender: BKButton) {
        guard let username = usernameTextField.text, let password = passwordTextField.text else {return}
        if username.isEmpty || password.isEmpty {
            UIAlertHelper.showAlertWithTitle("Error", message: "Please provide username and password", completionBlock: nil, onController: self)
        } else {
            requestLogin(username, password: password)
        }
    }
    
    // MARK: - Navigation
    
    func navigate() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate, let baseNavController = R.storyboard.main.baseNavigationController() {
            delegate.setRoot(baseNavController)
        }
    }
    
}

// MARK: - Web Service Call

extension LoginViewController: Requestable {
    
    func requestLogin(_ username: String, password: String) {
        _ = setupNetworkComponentWith(netapi: NetworkAPI.login(username: username, password: password), mapType: User.self, mappedObjectHandle: { (response) in
            self.navigate()
        }, objectArrayHandle: nil, moreInfo: { (message) in
            switch message {
            case .success: break
            case .fail(let errorMessage):
                UIAlertHelper.showAlertWithTitle("Login Error", message: errorMessage, completionBlock: nil, onController: nil, accessibility: "LoginFailAlert")
            }
        })
    }
}

