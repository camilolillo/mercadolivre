//
//  ListedItemsProtocols.swift
//  mercadolivre
//

// MARK: - View
protocol ListedItemsViewProtocol: ScreenSizeMeasurable {}


// MARK: - Interactor
protocol ListedItemsInteractorProtocol: AnyObject {
    func requesItemList(with parameters: GetItemListPerChildrenCategoryParameters, handler: @escaping Handler<GetItemListPerChildrenCategoryResult>)
    func getChildrenCategoryId() -> String
}


// MARK: - Presenter
protocol ListedItemsPresenterProtocol: ViewLifecycleable, CollectionViewable {
    func onBackButtonPressed()
}
