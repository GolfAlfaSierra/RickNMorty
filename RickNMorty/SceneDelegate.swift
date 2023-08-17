//
//  SceneDelegate.swift
//  RickNMorty
//
//  Created by artyom s on 17.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let rootVC = ViewController()
        self.window = window
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
    }
}

