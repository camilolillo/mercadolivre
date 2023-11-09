//
//  SearchPresenter.swift
//  mercadolivre
//

// MARK: - SearchPresenter
final class SearchPresenter {
    weak var view: SearchViewProtocol?
    var interactor: SearchInteractorProtocol?
    weak var delegate: SearchDelegate?
}

// MARK: - SearchPresenterProtocol
extension SearchPresenter: SearchPresenterProtocol {
    func onSearchButtonPressed(key: String?) {
        guard !(key?.isEmpty ?? true) else { return }
        guard let key else { return }
        let parameters = SearchParameters(searchKey: key)
        view?.set(loadingStatus: .loading)
        interactor?.requesItemList(with: parameters) { result in
            guard let data = result.results else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(loadingStatus: .loaded) }, cancelHandler: nil
                )
                return
            }
            self.view?.set(loadingStatus: .loaded)
            self.delegate?.onSearchedItemListRequested(items: data)
        }
    }
}


// MARK: - ViewLifecycleable
extension SearchPresenter: ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
}
