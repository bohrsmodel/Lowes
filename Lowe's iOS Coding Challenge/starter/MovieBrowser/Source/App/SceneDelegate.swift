//
//  SceneDelegate.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        
        let window = UIWindow(windowScene: windowScene)
        guard let controller = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as? SearchViewController else  {
            return
        }
        let coordinator = Coordinator(controller)
        controller.delegate = coordinator
        window.rootViewController = coordinator.navigationController
        self.window = window
        window.makeKeyAndVisible()
    }
}
