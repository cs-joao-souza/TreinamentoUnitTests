import Foundation

class LoginPresenter: LoginViewPresenter {
    weak var loginViewController: LoginViewController?
    
    func didFinishViewDidLoad() {
        loginViewController?.title = "Login"
    }
    
    func didClickExecuteLogin(username: String, password: String) {
        if let errorMessage = validate(username: username, password: password) {
            loginViewController?.showAlert(title: "Error", message: errorMessage)
        } else {
            loginViewController?.showAlert(title: "Login", message: "Logou!!!!")
        }
    }
    
    private func validate(username: String, password: String) -> String? {
        if username.isEmpty {
            return "Username obrigatório"
        } else if password.isEmpty {
            return "Password obrigatório"
        }
        
        return nil
    }
}
