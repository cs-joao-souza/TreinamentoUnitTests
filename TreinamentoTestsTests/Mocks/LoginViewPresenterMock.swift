//
//  LoginViewPresenterMock.swift
//  TreinamentoTestsTests
//
//  Created by j.parreiras.e.souza on 14/02/2019.
//  Copyright © 2019 João Pedro Souza. All rights reserved.
//

import Foundation
@testable import TreinamentoTests

class LoginViewPresenterMock: LoginViewPresenter {
    weak var loginViewController: LoginViewController?
    
    var isDidFinishViewDidLoadCalled = false
    var usernamePassed: String?
    var passwordPassed: String?
    
    func didFinishViewDidLoad() {
        isDidFinishViewDidLoadCalled = true
    }
    
    func didClickExecuteLogin(username: String, password: String) {
        usernamePassed = username
        passwordPassed = password
    }
}
