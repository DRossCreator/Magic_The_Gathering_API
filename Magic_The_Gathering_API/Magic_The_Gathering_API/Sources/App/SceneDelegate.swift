//
//  SceneDelegate.swift
//  Magic_The_Gathering_API
//
//  Created by Daniil Yarkovenko on 17.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let vc = CardsTableViewController()
        let navigationController = UINavigationController(rootViewController: vc)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGroupedBackground
        navigationController.navigationBar.standardAppearance = appearance;
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

    }

}

