//
//  ChildrenCategoriesWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - ChildrenCategoriesDelegate
typealias ChildrenCategoriesDelegate = BaseModuleDelegate


// MARK: - ChildrenCategoriesWireframe
enum ChildrenCategoriesWireframe {
    static func createModule(with delegate: ChildrenCategoriesDelegate) -> UIViewController {
        let view = ChildrenCategoriesViewController()
        let presenter = ChildrenCategoriesPresenter()
        let interactor = ChildrenCategoriesInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
