//
//  SplashWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - SplashDelegate
typealias SplashDelegate = BaseModuleDelegate & RootCategoriesModuleRequestable


// MARK: - SplashWireframe
enum SplashWireframe {
    static func createModule(with delegate: SplashDelegate) -> UIViewController {
        let view = SplashViewController()
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
