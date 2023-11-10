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
    func onViewDidLoad() {
        interactor?.getItem(with: interactor?.getItemId() ?? "") { result in
            guard let item = result.item else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(loadingStatus: .loaded) },
                    cancelHandler: nil
                )
                return
            }
            self.view?.set(item: item)
        }
    }
    func onViewWillAppear() {}
}
