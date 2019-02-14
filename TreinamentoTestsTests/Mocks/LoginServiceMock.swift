//
//  LoginServiceMock.swift
//  TreinamentoTestsTests
//
//  Created by j.parreiras.e.souza on 14/02/2019.
//  Copyright © 2019 João Pedro Souza. All rights reserved.
//

import Foundation
@testable import TreinamentoTests

class LoginServiceMock: LoginService {
    
    var resultLoginService: Result<User>?
    
    func login(username: String, password: String, completion: (Result<User>) -> Void) {        
        if let result = resultLoginService {
            completion(result)
        }
    }
}
