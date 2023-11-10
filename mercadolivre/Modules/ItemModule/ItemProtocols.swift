//
//  ItemProtocols.swift
//  mercadolivre
//

// MARK: - View
protocol ItemViewProtocol: ScreenSizeMeasurable {
    func set(loadingStatus: LoadingStatus)
    func set(item: Item)
    func reloadData()
}


// MARK: - Interactor
protocol ItemInteractorProtocol: AnyObject {
    func getItem(with ItemId: String, handler: @escaping Handler<GetItemResult>)
    func getItemId() -> String
}


// MARK: - Presenter
protocol ItemPresenterProtocol: ViewLifecycleable, CollectionViewable {}
