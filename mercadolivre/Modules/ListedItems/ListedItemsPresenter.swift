//
//  ListedItemsPresenter.swift
//  mercadolivre
//

import Foundation

// MARK: - ListedItemsPresenter
final class ListedItemsPresenter {
    weak var view: ListedItemsViewProtocol?
    var interactor: ListedItemsInteractorProtocol?
    weak var delegate: ListedItemsDelegate?

    private var dataSource: [ListedItemCellDataSource]? {
        didSet {
            view?.reloadData()
        }
    }
}

// MARK: - ListedItemsPresenterProtocol
extension ListedItemsPresenter: ListedItemsPresenterProtocol {
    func onBackButtonPressed() {
        delegate?.onGoBackRequested()
    }
}


// MARK: - ViewLifecycleable
extension ListedItemsPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        let parameters = GetItemListPerChildrenCategoryParameters(childrenCategoryId: interactor?.getChildrenCategoryId() ?? "")
        interactor?.requesItemList(with: parameters) { result in
            guard let data = result.results else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(loadingStatus: .loaded) }, cancelHandler: nil
                )
                return
            }
            self.dataSource = data
        }
    }
    func onViewWillAppear() {}
}
//MARK: -  CollectionViewable
extension ListedItemsPresenter: CollectionViewable {
    func onItemSelected(indexPath: IndexPath) {
        //TODO
    }
    func getNumberOfItems(in section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    func onCellForItem(in section: Int, at index: Int) -> DataSource? {
        return dataSource?[index]
    }
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String {
        return ItemCell.reuseIdentifier
    }
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double) {
        return (width: view!.screenWidth-24, height: 58)
    }
}
