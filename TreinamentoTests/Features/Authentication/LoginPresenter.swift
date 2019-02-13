import Foundation

class LoginPresenter: LoginViewPresenter {
    weak var loginViewController: LoginViewController?
    
    func didFinishViewDidLoad() {
        loginViewController?.title = "Login"
    }
    
    func didClickExecuteLogin(username: String, password: String) {
        loginViewController?.showAlert(title: "Login", message: "Logou!!!!")
    }
}
