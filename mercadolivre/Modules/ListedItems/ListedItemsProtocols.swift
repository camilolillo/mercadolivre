//
//  ListedItemsProtocols.swift
//  mercadolivre
//

// MARK: - View
protocol ListedItemsViewProtocol: AnyObject {}


// MARK: - Interactor
protocol ListedItemsInteractorProtocol: AnyObject {
    func requesItemList(with childrenCategoryId: String, handler: @escaping Handler<GetItemListPerChildrenCategoryResult>)
    func getChildrenCategoryId() -> String
}


// MARK: - Presenter
protocol ListedItemsPresenterProtocol: ViewLifecycleable {}
