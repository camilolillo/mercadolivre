//
//  ListedItemsPresenter.swift
//  mercadolivre
//

// MARK: - ListedItemsPresenter
final class ListedItemsPresenter {
    weak var view: ListedItemsViewProtocol?
    var interactor: ListedItemsInteractorProtocol?
    weak var delegate: ListedItemsDelegate?

    private var dataSource: [ItemCellDataSource]? {
        didSet {
            //TODO
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
            print(result)
        }
    }
    func onViewWillAppear() {}
}
//MARK: -  CollectionViewable
extension ListedItemsPresenter: CollectionViewable {
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
