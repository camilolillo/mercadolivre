//
//  CategoriesProtocols.swift
//  mercadolivre
//

import UIKit

enum ViewStatus {
    case loading
    case loaded
}

// MARK: - View
protocol RootCategoriesViewProtocol: ScreenSizeMeasurable {
    func set(viewStatus: ViewStatus)
    func reloadData()
}


// MARK: - Interactor
protocol RootCategoriesInteractorProtocol: AnyObject {
    func requestRootCategories(with handler: @escaping Handler<GetRootCategoriesResult>)
}


// MARK: - Presenter
protocol RootCategoriesPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onItemSelected(indexPath: IndexPath)
}
