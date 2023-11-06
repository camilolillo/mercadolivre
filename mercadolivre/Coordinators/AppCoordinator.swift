//
//  AppCoordinator.swift
//
//  Created by Camilo Lillo on 16-03-23.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
    
    override func start() {
        let vc = SplashWireframe.createModule(with: self)
        navigationController.setViewControllers([vc], animated: true)
    }
    
}
