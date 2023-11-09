//
//  SearchProtocols.swift
//  mercadolivre
//

// MARK: - View
protocol SearchViewProtocol: AnyObject {
    func set(loadingStatus: LoadingStatus)
}


// MARK: - Interactor
protocol SearchInteractorProtocol: AnyObject {
    func requesItemList(with parameters: SearchParameters, handler: @escaping Handler<GetItemListResult>)
}


// MARK: - Presenter
protocol SearchPresenterProtocol: ViewLifecycleable {
    func onSearchButtonPressed(key: String?)
}
