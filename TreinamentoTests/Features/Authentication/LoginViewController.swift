import UIKit
import SnapKit

protocol LoginViewPresenter {
    var loginViewController: LoginViewController? { get set }
    
    func didFinishViewDidLoad()
    func didClickExecuteLogin(username: String, password: String)
}

class LoginViewController: UIViewController, CodableView {

    let textFieldUsername: UITextField = {
       let textField = UITextField()
       textField.placeholder = "Username"
       textField.borderStyle = UITextField.BorderStyle.roundedRect
       textField.accessibilityLabel = "textField_username"
        
       return textField
    }()
    
    let textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.isSecureTextEntry = true
        textField.accessibilityLabel = "textField_password"
        
        
        return textField
    }()
    
    lazy var buttonLogin: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(executeLogin), for: UIControl.Event.touchUpInside)
        
        return button
    }()
    
    let viewReusable = ReusableView()
    
    var presenter: LoginViewPresenter
    
    init(presenter: LoginViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.loginViewController = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter.didFinishViewDidLoad()
    }
    
    func configureView() {
        view.backgroundColor = UIColor.white
    }
    
    func buildViewHierarchy() {
        view.addSubview(textFieldUsername)
        view.addSubview(textFieldPassword)
        view.addSubview(buttonLogin)
        view.addSubview(viewReusable)
    }
    
    func buildConstraints() {
        textFieldUsername.snp.makeConstraints { make in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(20)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(20)
            }
            
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(35)
        }
        
        textFieldPassword.snp.makeConstraints { make in
            make.top.equalTo(textFieldUsername.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(35)
        }
        
        buttonLogin.snp.makeConstraints { make in
            make.top.equalTo(textFieldPassword.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(50)
        }
        
        viewReusable.snp.makeConstraints { make in
            make.top.equalTo(buttonLogin.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(okAction)
                
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func executeLogin() {
        presenter.didClickExecuteLogin(username: textFieldUsername.text!, password: textFieldPassword.text!)
    }
}
