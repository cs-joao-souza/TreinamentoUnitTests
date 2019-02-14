import XCTest
@testable import TreinamentoTests

struct ErrorMock: Error {
    var localizedDescription: String {
        return "erro"
    }
}

class LoginPresenterTests: XCTestCase {
    
    var loginViewControllerMock: LoginViewControllerMock!
    var loginServiceMock: LoginServiceMock!
    var sut: LoginPresenter!
    
    override func setUp() {
        loginServiceMock = LoginServiceMock()
        sut = LoginPresenter(service: loginServiceMock)
        loginViewControllerMock = LoginViewControllerMock(presenter: sut)
    }
    
    func testIfShowAlertIsCalledWhenAFailureIsReturned() {
        loginServiceMock.resultLoginService = Result.failure(ErrorMock())
        sut.didClickExecuteLogin(username: "joao", password: "senha")
        
        XCTAssertTrue(loginViewControllerMock.isShowAlertCalled)
    }
    
    func testIfPushViewControllerFromNavigationIsCalled() {
        loginServiceMock.resultLoginService = Result.success(User())
    }

    override func tearDown() {     
    }
}
