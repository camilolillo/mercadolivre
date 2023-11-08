//
//  ChildrenCategoriesProtocols.swift
//  mercadolivre
//

import UIKit

// MARK: - View
protocol ChildrenCategoriesViewProtocol: ScreenSizeMeasurable {
    func set(viewStatus: ViewStatus)
    func reloadData()
}


// MARK: - Interactor
protocol ChildrenCategoriesInteractorProtocol: AnyObject {
    func requestRootCategories(with handler: @escaping Handler<GetRootCategoriesResult>)
}


// MARK: - Presenter
protocol ChildrenCategoriesPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onItemSelected(indexPath: IndexPath)
}
