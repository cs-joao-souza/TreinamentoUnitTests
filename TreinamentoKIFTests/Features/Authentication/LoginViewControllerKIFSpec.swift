//
//  LoginViewControllerKIFSpec.swift
//  TreinamentoTests
//
//  Created by João Pedro Souza on 06/05/2019.
//Copyright © 2019 João Pedro Souza. All rights reserved.
//

import Quick
import Nimble
import KIF
@testable import TreinamentoTests

extension XCTestCase {
    func tester(file : String = #file, _ line : Int = #line) -> KIFUITestActor {
        return KIFUITestActor(inFile: file, atLine: line, delegate: self)
    }
    
    func system(file : String = #file, _ line : Int = #line) -> KIFSystemTestActor {
        return KIFSystemTestActor(inFile: file, atLine: line, delegate: self)
    }
}

class LoginViewControllerKIFSpec: QuickSpec {
    
    var sut: LoginViewController!
    
	override func spec() {
		describe("LoginViewController") {
            
            var presenterMock: LoginPresenter!
            
            beforeEach {
                presenterMock = LoginPresenter()
                self.sut = LoginViewController(presenter: presenterMock)
                KIFEnableAccessibility()
            }
            
            it("has to show username error message") {
                 self.loadScreen()
                    .with(username: "")
                    .with(password: "teste")
                    .tapLoginButton()
                    .isAlertWith(message: "Username obrigatório")
            }
            
            it("has to show password error message") {
                self.loadScreen()
                    .with(username: "teste")
                    .with(password: "")
                    .tapLoginButton()
                    .isAlertWith(message: "Password obrigatório")
            }
		}
	}
    
    func loadScreen() -> Self {
        UIApplication.shared.keyWindow?.rootViewController = UINavigationController(rootViewController: sut)
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
        
        return self
    }
    
    func with(username: String) -> Self {
        tester().enterText(username, intoViewWithAccessibilityLabel: "textField_username")
        
        return self
    }
    
    func with(password: String) -> Self {
        tester().enterText(password, intoViewWithAccessibilityLabel: "textField_password")

        return self
    }
    
    func tapLoginButton() -> Self {
        tester().tapView(withAccessibilityLabel: "Login")

        return self
    }
    
    func isAlertWith(message: String) {
        tester().waitForView(withAccessibilityLabel: message)
    }
}
