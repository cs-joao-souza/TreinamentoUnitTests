//
//  LoginViewControllerMock.swift
//  TreinamentoTestsTests
//
//  Created by j.parreiras.e.souza on 14/02/2019.
//  Copyright © 2019 João Pedro Souza. All rights reserved.
//

import UIKit
@testable import TreinamentoTests

class LoginViewControllerMock: LoginViewController {

    var isShowAlertCalled = false

    override func showAlert(title: String, message: String) {
        self.isShowAlertCalled = true
    }

}
