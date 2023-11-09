//
//  ChildrenCategoriesWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - ChildrenCategoriesDelegate
typealias ChildrenCategoriesDelegate = BaseModuleDelegate & ItemListPerChildrenCategoryRequestable


// MARK: - ChildrenCategoriesWireframe
enum ChildrenCategoriesWireframe {
    static func createModule(with delegate: ChildrenCategoriesDelegate, rootCategoryId: String) -> UIViewController {
        let view = ChildrenCategoriesViewController()
        let presenter = ChildrenCategoriesPresenter()
        let interactor = ChildrenCategoriesInteractor(
            getChildrenCategoriesClient: GetChildrenCategoriesClient(),
            rootCategoryId: rootCategoryId
        )

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
