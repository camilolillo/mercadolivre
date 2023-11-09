//
//  ListedItemsInteractor.swift
//  mercadolivre
//

// MARK: - ListedItemsInteractor
final class ListedItemsInteractor {
    private var childrenCategoryId: String
    private var getItemListPerChildrenCategoryClient: GetItemListPerChildrenCategoryClientProtocol
    init(childrenCategoryId: String, getItemListPerChildrenCategoryClient: GetItemListPerChildrenCategoryClientProtocol) {
        self.childrenCategoryId = childrenCategoryId
        self.getItemListPerChildrenCategoryClient = getItemListPerChildrenCategoryClient
    }
}

// MARK: - ListedItemsInteractorProtocol
extension ListedItemsInteractor: ListedItemsInteractorProtocol {
    func requesItemList(with childrenCategoryId: String, handler: @escaping Handler<GetItemListPerChildrenCategoryResult>) {
        getItemListPerChildrenCategoryClient.getItemList(with: childrenCategoryId) { result in
            print(result)
        }
    }
    func getChildrenCategoryId() -> String {
        return childrenCategoryId
    }
}
