//
//  ListedItemsWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - ListedItemsDelegate
typealias ListedItemsDelegate = BaseModuleDelegate & SearchItemRequestable


// MARK: - ListedItemsWireframe
enum ListedItemsWireframe {
    static func createModule(with delegate: ListedItemsDelegate, childrenCategoryId: String, itemList: [Item]?) -> UIViewController {
        let view = ListedItemsViewController()
        let presenter = ListedItemsPresenter()
        let interactor = ListedItemsInteractor(
            childrenCategoryId: childrenCategoryId,
            getItemListPerChildrenCategoryClient: GetItemListPerChildrenCategoryClient(),
            itemList: itemList
        )

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
