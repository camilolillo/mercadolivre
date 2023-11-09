//
//  ListedItemsProtocols.swift
//  mercadolivre
//
import Foundation

// MARK: - View
protocol ListedItemsViewProtocol: ScreenSizeMeasurable {
    func set(loadingStatus: LoadingStatus)
    func reloadData()
}


// MARK: - Interactor
protocol ListedItemsInteractorProtocol: AnyObject {
    func requesItemList(with parameters: GetItemListPerChildrenCategoryParameters, handler: @escaping Handler<GetItemListPerChildrenCategoryResult>)
    func getChildrenCategoryId() -> String
}


// MARK: - Presenter
protocol ListedItemsPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onItemSelected(indexPath: IndexPath)
    func onBackButtonPressed()
}
