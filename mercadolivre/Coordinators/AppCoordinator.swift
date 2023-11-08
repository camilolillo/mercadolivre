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

extension AppCoordinator: RootCategoriesModuleRequestable {
    func onRootCategoriesModuleRequested() {
        let vc = RootCategoriesWireframe.createModule(with: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: ChildrenCategoriesModuleRequestable {
    func onChildrenCategoriesModuleRequested(with childrenCategoryId: String) {
        let vc = ChildrenCategoriesWireframe.createModule(with: self, childrenCategoryId: childrenCategoryId)
        navigationController.pushViewController(vc, animated: true)
    }
}
