//
//  ItemWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - ItemDelegate
typealias ItemDelegate = BaseModuleDelegate


// MARK: - ItemWireframe
enum ItemWireframe {
    static func createModule(with delegate: ItemDelegate) -> UIViewController {
        let view = ItemViewController()
        let presenter = ItemPresenter()
        let interactor = ItemInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
