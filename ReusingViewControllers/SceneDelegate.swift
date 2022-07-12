import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let view = QuoteView()
        let viewController = ReusableViewController(with: view)

        viewController.didLoadView = {
            view.setupData(
                imageName: "einstein",
                quote: "I fear the day people, in order to sound smart, quote me on Instagram with a ton of crap I never even said.",
                author: "Albert Einstein"
            )
        }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
