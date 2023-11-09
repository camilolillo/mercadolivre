//
//  ListedItemsWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - ListedItemsDelegate
typealias ListedItemsDelegate = BaseModuleDelegate


// MARK: - ListedItemsWireframe
enum ListedItemsWireframe {
    static func createModule(with delegate: ListedItemsDelegate, childrenCategoryId: String) -> UIViewController {
        let view = ListedItemsViewController()
        let presenter = ListedItemsPresenter()
        let interactor = ListedItemsInteractor(
            childrenCategoryId: childrenCategoryId
        )

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
