//
//  ListedItemsInteractor.swift
//  mercadolivre
//

// MARK: - ListedItemsInteractor
final class ListedItemsInteractor {
    private var childrenCategoryId: String
    init(childrenCategoryId: String) {
        self.childrenCategoryId = childrenCategoryId
    }
}

// MARK: - ListedItemsInteractorProtocol
extension ListedItemsInteractor: ListedItemsInteractorProtocol {
    func requesItemList(with childrenCategoryId: String, handler: @escaping Handler<GetItemListPerChildrenCategoryResult>) {
        //TODO
    }
    func getChildrenCategoryId() -> String {
        return childrenCategoryId
    }
}
