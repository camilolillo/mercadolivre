//
//  AppCoordinator.swift
//
//  Created by Camilo Lillo on 16-03-23.
//

import Foundation
import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private var searchNavigationControllerToPresent: UINavigationController? {
        didSet {
            guard let searchNavigationControllerToPresent else { return }
            navigationController.present(searchNavigationControllerToPresent, animated: true)
        }
    }
    
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
        let vc = ListedItemsWireframe.createModule(with: self, childrenCategoryId: childrenCategoryId, itemList: nil)
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: SearchItemRequestable {
    func onSearchItemRequested() {
        let vc = SearchWireframe.createModule(with: self)
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .pageSheet
        if #available(iOS 15.0, *) {
            if let sheet = nav.sheetPresentationController {
                sheet.detents = [.medium()]
            }
        }
        self.searchNavigationControllerToPresent = nav
    }
}

extension AppCoordinator: SearchedItemListRequestable {
    func onSearchedItemListRequested(items: [Item]) {
        let vc = ListedItemsWireframe.createModule(with: self, childrenCategoryId: "", itemList: items)
        searchNavigationControllerToPresent?.dismiss(animated: true) {
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
