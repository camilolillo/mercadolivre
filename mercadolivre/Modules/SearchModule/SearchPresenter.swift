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
        interactor?.requesItemList(with: parameters) { result in
            print(result)
        }
    }
}


// MARK: - ViewLifecycleable
extension SearchPresenter: ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
}
