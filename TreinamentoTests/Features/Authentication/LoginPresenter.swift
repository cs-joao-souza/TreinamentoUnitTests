import UIKit

class LoginPresenter: LoginViewPresenter {
    weak var loginViewController: LoginViewController?
    
    let service: LoginService
    
    init(service: LoginService) {
        self.service = service
    }
    
    func didFinishViewDidLoad() {
        loginViewController?.title = "Login"
    }
    
    func didClickExecuteLogin(username: String, password: String) {
        service.login(username: username, password: password) { result in
            switch result {
            case .success(let _):
                let viewController = UIViewController()
                viewController.view.backgroundColor = .red
                self.loginViewController?.navigationController?.pushViewController(viewController, animated: true)
            case .failure(_):
                self.loginViewController?.showAlert(title: "Error", message: "Falha ao logar")
            }
        }
    }
}
