import Quick
import Nimble
@testable import TreinamentoTests

class LoginViewControllerSpec: QuickSpec {
	override func spec() {
        var presenterMock: LoginViewPresenterMock!
        var sut: LoginViewController!
        
        beforeEach {
            presenterMock = LoginViewPresenterMock()
            sut = LoginViewController(presenter: presenterMock)
            _ = sut.view            
        }
        
        context("when it is inialized") {
            it("has to set all properties properly") {
                expect(sut.presenter).toNot(beNil())
                expect(sut.presenter.loginViewController).toNot(beNil())
            }
        }
        
        context("when its loaded") {
            expect(sut.textFieldUsername.placeholder).to(equal("Username"))
            it("has to configure textFieldUsername properly") {
                expect(sut.textFieldUsername.placeholder).to(equal("Username"))
                expect(sut.textFieldUsername.borderStyle == UITextField.BorderStyle.roundedRect).to(beTrue())
                expect(sut.textFieldUsername.superview).to(equal(sut.view))
            }
            
            it("has to configure textFieldPassword properly") {
                expect(sut.textFieldPassword.placeholder).to(equal("Senha"))
                expect(sut.textFieldPassword.borderStyle == UITextField.BorderStyle.roundedRect).to(beTrue())
                expect(sut.textFieldPassword.superview).to(equal(sut.view))
            }
        }
        
        context("when executeLogin is called") {
            beforeEach {
                sut.textFieldUsername.text = "joaopedro"
                sut.textFieldPassword.text = "senha"
                sut.executeLogin()
            }
            
            it("has to call didClickExecuteLogin") {
                expect(presenterMock.usernamePassed).to(equal("joaopedro"))
                expect(presenterMock.passwordPassed).to(equal("senha"))
                
                expect(2).to(beGreaterThan(0))
                expect(sut).to(beAKindOf(UIViewController.self))
            }
        }
	}
}
