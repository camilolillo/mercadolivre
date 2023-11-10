//
//  AppCoordinator.swift
//
//  Created by Camilo Lillo on 16-03-23.
//

import Foundation
import UIKit

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
    func onChildrenCategoriesModuleRequested(with rootCategoryId: String) {
        let vc = ChildrenCategoriesWireframe.createModule(with: self, rootCategoryId: rootCategoryId)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: ItemListPerChildrenCategoryRequestable {
    func onItemListRequested(with childrenCategoryId: String) {
        let vc = ListedItemsWireframe.createModule(with: self, childrenCategoryId: childrenCategoryId)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: ItemRequestable {
    func onItemDetailRequested(with itemId: String) {
        let vc = ItemWireframe.createModule(with: self, itemId: itemId)
        navigationController.present(vc, animated: true)
    }
}
