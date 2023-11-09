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
    func requestRootCategories(with childrenCategoryId: String, handler: @escaping Handler<GetChildrenCategoriesResult>)
    func getChildrenCategoryId() -> String
}


// MARK: - Presenter
protocol ChildrenCategoriesPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onItemSelected(indexPath: IndexPath)
    func onBackButtonPressed()
}
