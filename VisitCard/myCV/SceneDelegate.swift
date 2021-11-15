//
//  SceneDelegate.swift
//  VisitCard
//
//  Created by Артем Соловьев on 12.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            let tabs = createTabs()
            window.rootViewController = tabs
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }

}

private extension SceneDelegate {
    func createTabs() -> UITabBarController {
        let tabBar = UITabBarController()
        let profileVC = ViewController()
        let skillsVC = SecondViewController()
        let hobbyVC = ThirdViewController()
        profileVC.tabBarItem = self.createProfileTab()
        skillsVC.tabBarItem = self.createSkillsTab()
        hobbyVC.tabBarItem = self.createHobbyTab()

        tabBar.setViewControllers([profileVC, skillsVC, hobbyVC], animated: false)
        return tabBar
    }

    func createProfileTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        return item
    }

    func createSkillsTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Skills", image: UIImage(systemName: "star"), tag: 1)
        return item
    }

    func createHobbyTab() -> UITabBarItem {
        let item = UITabBarItem(title: "Hobby", image: UIImage(systemName: "circle.hexagongrid"), tag: 2)
        return item
    }
}
