import Quick
import Nimble
@testable import TreinamentoTests

class LoginViewControllerSpec: QuickSpec {
	override func spec() {
        
        var presenterMock: LoginPresenterMock!
        var sut: LoginViewController!
        
        beforeEach {
            presenterMock = LoginPresenterMock()
            sut = LoginViewController(presenter: presenterMock)
            _ = sut.view
        }
        
        context("when it is instantiated") {
            it("has to configure presenter") {
                expect(sut.presenter).toNot(beNil())
                expect(sut.presenter.loginViewController).toNot(beNil())
            }
        }
        
        context("when its loaded") {
            it("has to configure textFieldUsername") {
                expect(sut.textFieldUsername.placeholder).to(equal("Username"))
                expect(sut.textFieldUsername.borderStyle).to(equal(UITextField.BorderStyle.roundedRect))
                expect(sut.textFieldUsername.superview).to(equal(sut.view))
            }
            
            it("has to configure textFieldPassword") {
                expect(sut.textFieldPassword.placeholder).to(equal("Password"))
                expect(sut.textFieldPassword.borderStyle).to(equal(UITextField.BorderStyle.roundedRect))
                expect(sut.textFieldPassword.isSecureTextEntry).to(beTrue())
                expect(sut.textFieldPassword.superview).to(equal(sut.view))
            }
            
            it("has to configure buttonLogin") {
                expect(sut.buttonLogin.title(for: .normal)).to(equal("Login"))
                expect(sut.buttonLogin.titleColor(for: .normal)?.cgColor).to(equal(UIColor.white.cgColor))
                expect(sut.buttonLogin.backgroundColor?.cgColor).to(equal(UIColor.black.cgColor))
                expect(sut.buttonLogin.target(forAction: #selector(LoginViewController.executeLogin), withSender: sut.buttonLogin)).toNot(beNil())
                expect(sut.buttonLogin.superview).to(equal(sut.view))
            }
            
            it("has to configure view") {
                expect(sut.view.backgroundColor?.cgColor).to(equal(UIColor.white.cgColor))
            }
            
            it("has to call didFinishViewDidLoad from presenter") {
                expect(presenterMock.isDidFinishViewDidLoadCalled).to(beTrue())
            }
        }
        
        context("when executeLogin is called") {
            beforeEach {
                sut.executeLogin()
            }
            
            it("has to call didClickExecuteLogin from presenter") {
                expect(presenterMock.isDidClickExecuteLoginCalled).to(beTrue())
            }
        }
	}
}
