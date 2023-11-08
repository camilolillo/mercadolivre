//
//  CategoriesWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - CategoriesDelegate
typealias RootCategoriesDelegate = BaseModuleDelegate & CategoriesModuleRequestable


// MARK: - CategoriesWireframe
enum RootCategoriesWireframe {
    static func createModule(with delegate: RootCategoriesDelegate) -> UIViewController {
        let view = RootCategoriesViewController()
        let presenter = RootCategoriesPresenter()
        
        let interactor = RootCategoriesInteractor(
            categoriesClient: GetProductRootCategoriesClient()
        )

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
