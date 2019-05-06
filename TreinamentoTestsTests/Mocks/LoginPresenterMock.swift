import Foundation
@testable import TreinamentoTests

class LoginPresenterMock: LoginViewPresenter {
    weak var loginViewController: LoginViewController?
    
    var isDidFinishViewDidLoadCalled = false
    var isDidClickExecuteLoginCalled = false
    
    func didFinishViewDidLoad() {
        isDidFinishViewDidLoadCalled = true
    }
    
    func didClickExecuteLogin(username: String, password: String) {
        isDidClickExecuteLoginCalled = true
    }
}
