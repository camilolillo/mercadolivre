//
//  CategoriesWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - CategoriesDelegate
typealias CategoriesDelegate = BaseModuleDelegate & CategoriesModuleRequestable


// MARK: - CategoriesWireframe
enum CategoriesWireframe {
    static func createModule(with delegate: CategoriesDelegate) -> UIViewController {
        let view = CategoriesViewController()
        let presenter = CategoriesPresenter()
        
        let interactor = CategoriesInteractor(
            categoriesClient: GetProductRootCategoriesClient()
        )

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
