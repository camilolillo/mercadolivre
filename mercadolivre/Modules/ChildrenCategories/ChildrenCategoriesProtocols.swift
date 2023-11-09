//
//  ChildrenCategoriesProtocols.swift
//  mercadolivre
//

import UIKit

struct ChildrenCategoriesValues {
    var name: String
    var imageStringUrl: String
}

// MARK: - View
protocol ChildrenCategoriesViewProtocol: ScreenSizeMeasurable {
    func set(loadingStatus: LoadingStatus)
    func set(values: ChildrenCategoriesValues)
    func reloadData()
}


// MARK: - Interactor
protocol ChildrenCategoriesInteractorProtocol: AnyObject {
    func requestChildrentCategories(with rootCategoryId: String, handler: @escaping Handler<GetChildrenCategoriesResult>)
    func getRootCategoryId() -> String
}


// MARK: - Presenter
protocol ChildrenCategoriesPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onItemSelected(indexPath: IndexPath)
    func onBackButtonPressed()
    func onSearchButtonPressed()
}
