//
//  ListedItemsInteractor.swift
//  mercadolivre
//

// MARK: - ListedItemsInteractor
final class ListedItemsInteractor {
    private var childrenCategoryId: String
    private var getItemListPerChildrenCategoryClient: GetItemListPerChildrenCategoryClientProtocol
    private var itemList: [Item]?
    init(childrenCategoryId: String, getItemListPerChildrenCategoryClient: GetItemListPerChildrenCategoryClientProtocol, itemList: [Item]?) {
        self.childrenCategoryId = childrenCategoryId
        self.getItemListPerChildrenCategoryClient = getItemListPerChildrenCategoryClient
        self.itemList = itemList
    }
}

// MARK: - ListedItemsInteractorProtocol
extension ListedItemsInteractor: ListedItemsInteractorProtocol {
    func requesItemList(with parameters: GetItemListPerChildrenCategoryParameters, handler: @escaping Handler<GetItemListResult>) {
        let failureResult = GetItemListResult(message: .defaultAlertMessage)
        if let items = itemList {
            handler(GetItemListResult(message: "Success", results: items))
        } else {
            getItemListPerChildrenCategoryClient.getItemList(with: parameters) { result in
                switch result {
                case .success(let response):
                    guard !response.results.isEmpty else {
                        handler(failureResult)
                        return
                    }
                    handler(GetItemListResult(message: "Success", results: response.results))
                case .failure(let error):
                    print(error)
                    handler(failureResult)
                }
            }
        }
    }
    func getChildrenCategoryId() -> String {
        return childrenCategoryId
    }
}
