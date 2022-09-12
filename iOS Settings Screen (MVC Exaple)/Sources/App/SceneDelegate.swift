//
//  SceneDelegate.swift
//  iOS Settings Screen (MVC Exaple)
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let settingsViewController = SettingsViewController()
        let navigationController = UINavigationController(rootViewController: settingsViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
