import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()

        return true
    }
    
    private func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let presenter = LoginPresenter(service: APIClientLoginService())
        let loginViewController = LoginViewController(presenter: presenter)
        let navigationController = UINavigationController(rootViewController: loginViewController)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

