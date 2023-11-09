//
//  ListedItemsPresenter.swift
//  mercadolivre
//

// MARK: - ListedItemsPresenter
final class ListedItemsPresenter {
    weak var view: ListedItemsViewProtocol?
    var interactor: ListedItemsInteractorProtocol?
    weak var delegate: ListedItemsDelegate?
}

// MARK: - ListedItemsPresenterProtocol
extension ListedItemsPresenter: ListedItemsPresenterProtocol {}


// MARK: - ViewLifecycleable
extension ListedItemsPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        let parameters = GetItemListPerChildrenCategoryParameters(childrenCategoryId: interactor?.getChildrenCategoryId() ?? "")
        interactor?.requesItemList(with: parameters) { result in
            print(result)
        }
    }
    func onViewWillAppear() {}
}
