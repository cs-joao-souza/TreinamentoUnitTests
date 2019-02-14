import Foundation

protocol LoginService {
    func login(username: String, password: String, completion: (Result<User>) -> Void)
}

class APIClientLoginService: LoginService {
    let client: APIClient
    
    init(client: APIClient = APIClient()) {
        self.client = client
    }
    
    func login(username: String, password: String, completion: (Result<User>) -> Void) {
        self.client.request(url: "api.concrete.com.br", method: "POST", completion: completion)
    }
}

