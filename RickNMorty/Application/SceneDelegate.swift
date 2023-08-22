//
//  SceneDelegate.swift
//  RickNMorty
//
//  Created by Artyom S on 17.08.2023.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        let rootViewController = CharactersViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)

        configureNavigationBarAppearance()

        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    func configureNavigationBarAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = .white
        appearance.setBackgroundImage(UIImage(), for: .default)
        appearance.shadowImage = UIImage()
        appearance.backgroundColor = .clear
        appearance.isTranslucent = true
    }
}
