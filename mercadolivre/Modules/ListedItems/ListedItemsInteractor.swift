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
    func requesItemList(with parameters: GetItemListPerChildrenCategoryParameters, handler: @escaping Handler<GetItemListPerChildrenCategoryResult>) {
        let failureResult = GetItemListPerChildrenCategoryResult(message: .defaultAlertMessage)
        getItemListPerChildrenCategoryClient.getItemList(with: parameters) { result in
            switch result {
            case .success(let response):
                guard !response.results.isEmpty else {
                    handler(failureResult)
                    return
                }
                handler(GetItemListPerChildrenCategoryResult(message: "Success", results: response.results))
            case .failure(let error):
                handler(failureResult)
            }
        }
    }
    func getChildrenCategoryId() -> String {
        return childrenCategoryId
    }
}
