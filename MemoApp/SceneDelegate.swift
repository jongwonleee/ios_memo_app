//
//  SceneDelegate.swift
//  MemoApp
//
//  Created by 이종원 on 2020/12/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: MemoListViewController())
        navigationController.navigationBar.barTintColor = .white

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }

}
