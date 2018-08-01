//
//  BookStoreUITests.swift
//  BookStoreUITests
//
//  Created by Kushal Ashok on 8/1/18.
//  Copyright © 2018 speed. All rights reserved.
//

import XCTest

class BookStoreUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testLoginSuccess() {
        //Set expectations
        let menuButton = app.navigationBars["BookStore.BooksTableView"].children(matching: .button).element
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: menuButton, handler: nil)
        
        //Execute
        let usernamefieldTextField = app/*@START_MENU_TOKEN@*/.textFields["usernameField"]/*[[".textFields[\"Username\"]",".textFields[\"usernameField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernamefieldTextField.tap()
        //Clear textfield if text found
        if let text = usernamefieldTextField.value as? String {
            print(text.count)
            let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            _ = text.map{ char -> String in
                deleteKey.tap()
                return ""
            }
        }
        let hKey = app/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        hKey.tap()
        let sKey = app/*@START_MENU_TOKEN@*/.keys["s"]/*[[".keyboards.keys[\"s\"]",".keys[\"s\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        sKey.tap()
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        app/*@START_MENU_TOKEN@*/.secureTextFields["passwordField"]/*[[".secureTextFields[\"Password\"]",".secureTextFields[\"passwordField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["6"]/*[[".keyboards.keys[\"6\"]",".keys[\"6\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.toolbars["Toolbar"].buttons["Toolbar Done Button"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["loginButton"]/*[[".buttons[\"login\"]",".buttons[\"loginButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //Check
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(menuButton.exists)
    }
    
    func testLoginFailureAlert() {
        let usernamefieldTextField = app/*@START_MENU_TOKEN@*/.textFields["usernameField"]/*[[".textFields[\"Username\"]",".textFields[\"usernameField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernamefieldTextField.tap()
        usernamefieldTextField.typeText("wrong")
        let passwordfieldTextField = app/*@START_MENU_TOKEN@*/.secureTextFields["passwordField"]/*[[".secureTextFields[\"Password\"]",".secureTextFields[\"passwordField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordfieldTextField.tap()
        passwordfieldTextField.typeText("wrong")
        app.toolbars["Toolbar"].buttons["Toolbar Done Button"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["loginButton"]/*[[".buttons[\"login\"]",".buttons[\"loginButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let loginAlert = app.alerts["Login Error"]
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: loginAlert, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(loginAlert.exists)
    }
    
    func testPullToRefresh() {
        loginToApp()
        let table = app.tables["BooksTable"]
        let firstCell = app.tables["BooksTable"].cells.firstMatch
        let coordinate = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let bottom = firstCell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 10))
        coordinate.press(forDuration: 0, thenDragTo: bottom)
        XCTAssert(table.exists)
    }
    
    func testLogOut() {
        loginToApp()
        app.navigationBars["BookStore.BooksTableView"].children(matching: .button).element.tap()
        app.alerts["Logout"].buttons["Yes"].tap()
        
        //Set expectations
        let usernamefieldTextField = app/*@START_MENU_TOKEN@*/.textFields["usernameField"]/*[[".textFields[\"Username\"]",".textFields[\"usernameField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: usernamefieldTextField, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssert(usernamefieldTextField.exists)
    }
    
    func loginToApp() {
        let usernamefieldTextField = app/*@START_MENU_TOKEN@*/.textFields["usernameField"]/*[[".textFields[\"Username\"]",".textFields[\"usernameField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        usernamefieldTextField.tap()
        //Clear textfield if text found
        if let text = usernamefieldTextField.value as? String {
            print(text.count)
            let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            _ = text.map{ char -> String in
                deleteKey.tap()
                return ""
            }
        }
        usernamefieldTextField.typeText("hsbc")
        let passwordfieldTextField = app/*@START_MENU_TOKEN@*/.secureTextFields["passwordField"]/*[[".secureTextFields[\"Password\"]",".secureTextFields[\"passwordField\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        passwordfieldTextField.tap()
        passwordfieldTextField.typeText("123456")
        app.toolbars["Toolbar"].buttons["Toolbar Done Button"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["loginButton"]/*[[".buttons[\"login\"]",".buttons[\"loginButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let menuButton = app.navigationBars["BookStore.BooksTableView"].children(matching: .button).element
        let exists = NSPredicate(format: "exists == true")
        expectation(for: exists, evaluatedWith: menuButton, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
