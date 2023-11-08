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
protocol CategoriesViewProtocol: ScreenSizeMeasurable {
    func set(viewStatus: ViewStatus)
    func reloadData()
}


// MARK: - Interactor
protocol CategoriesInteractorProtocol: AnyObject {
    func requestRootCategories(with handler: @escaping Handler<GetRootCategoriesResult>)
}


// MARK: - Presenter
protocol CategoriesPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onItemSelected(indexPath: IndexPath)
}
