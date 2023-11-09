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
extension SearchPresenter: SearchPresenterProtocol {}


// MARK: - ViewLifecycleable
extension SearchPresenter: ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
}
