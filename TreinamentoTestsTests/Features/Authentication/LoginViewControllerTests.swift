import XCTest
@testable import TreinamentoTests

class LoginViewControllerTests: XCTestCase {

    var presenterMock: LoginViewPresenterMock!
    var sut: LoginViewController!
    
    override func setUp() {
        presenterMock = LoginViewPresenterMock()
        sut = LoginViewController(presenter: presenterMock)
        _ = sut.view
    }
    
    func testIfViewIsConfiguredProperly() {
        XCTAssertTrue(sut.view.backgroundColor?.cgColor == UIColor.white.cgColor)
    }
    
    func testIfButtonLoginIsConfiguredProperly() {
        XCTAssertEqual(sut.buttonLogin.title(for: UIControl.State.normal), "Login")
        XCTAssertEqual(sut.buttonLogin.backgroundColor?.cgColor, UIColor.black.cgColor)
        XCTAssertEqual(sut.buttonLogin.titleColor(for: UIControl.State.normal)?.cgColor, UIColor.white.cgColor)
        XCTAssertEqual(sut.buttonLogin.superview, sut.view)
    }
    
    func testIfTextFieldUsernameIsConfigured() {
        XCTAssertTrue(sut.textFieldUsername.borderStyle == UITextField.BorderStyle.roundedRect)
        XCTAssertTrue(sut.textFieldUsername.placeholder == "Username")
        XCTAssertTrue(sut.textFieldUsername.superview == sut.view)
    }
    
    func testIfDidFinishViewDidLoadFromPresenterIsCalledAfterViewDidLoad() {
        XCTAssertTrue(presenterMock.isDidFinishViewDidLoadCalled)
    }
    
    func testIfDidClickExecuteLoginIsCalledWithProperlyData() {
        sut.textFieldUsername.text = "joaopedro"
        sut.textFieldPassword.text = "senha"
        sut.executeLogin()
        
        XCTAssertTrue(presenterMock.usernamePassed == "joaopedro")
        XCTAssertTrue(presenterMock.passwordPassed == "senha")
        
    }

    override func tearDown() {
    }
}
