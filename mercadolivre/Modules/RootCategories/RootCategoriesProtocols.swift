//
//  CategoriesProtocols.swift
//  mercadolivre
//

import UIKit

enum LoadingStatus {
    case loading
    case loaded
}

// MARK: - View
protocol RootCategoriesViewProtocol: ScreenSizeMeasurable {
    func set(loadingStatus: LoadingStatus)
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
