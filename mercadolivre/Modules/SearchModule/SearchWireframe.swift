//
//  SearchWireframe.swift
//  mercadolivre
//

import UIKit

// MARK: - SearchDelegate
typealias SearchDelegate = BaseModuleDelegate & SearchedItemListRequestable


// MARK: - SearchWireframe
enum SearchWireframe {
    static func createModule(with delegate: SearchDelegate) -> UIViewController {
        let view = SearchViewController()
        let presenter = SearchPresenter()
        let interactor = SearchInteractor(
            searchClient: SearchClient()
        )

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.delegate = delegate

        return view
    }
}
