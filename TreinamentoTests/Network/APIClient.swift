//
//  APIClient.swift
//  TreinamentoTests
//
//  Created by j.parreiras.e.souza on 14/02/2019.
//  Copyright © 2019 João Pedro Souza. All rights reserved.
//

import Foundation

enum Result<T: Decodable> {
    case success(T)
    case failure(Error)
}

class APIClient {
    
    init() {
        
    }
    
    func request<T:Decodable>(url: String, method: String, completion: (Result<T>) -> Void) {
        
    }
}
