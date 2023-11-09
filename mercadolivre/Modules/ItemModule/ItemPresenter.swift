//
//  ItemPresenter.swift
//  mercadolivre
//

// MARK: - ItemPresenter
final class ItemPresenter {
    weak var view: ItemViewProtocol?
    var interactor: ItemInteractorProtocol?
    weak var delegate: ItemDelegate?
}

// MARK: - ItemPresenterProtocol
extension ItemPresenter: ItemPresenterProtocol {}


// MARK: - ViewLifecycleable
extension ItemPresenter: ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
}
