//
//  SceneDelegate.swift
//  Cars
//
//  Created by Артем Соловьев on 10.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
//        let navigation = UINavigationController()
//        navigation.viewControllers = [ChooseViewController()]
        let vc = ChooseAsembly.build()
        
        window.rootViewController =  UINavigationController(rootViewController: vc)
        window.makeKeyAndVisible()
        self.window = window
    }
}
