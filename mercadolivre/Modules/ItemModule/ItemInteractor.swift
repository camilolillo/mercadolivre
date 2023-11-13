//
//  ItemInteractor.swift
//  mercadolivre
//

// MARK: - ItemInteractor
final class ItemInteractor {
    private var itemId: String
    private var getItemClient: GetItemClientProtocol
    init(itemId: String, getItemClient: GetItemClientProtocol) {
        self.itemId = itemId
        self.getItemClient = getItemClient
    }
}

// MARK: - ItemInteractorProtocol
extension ItemInteractor: ItemInteractorProtocol {
    func getItem(with ItemId: String, handler: @escaping Handler<GetItemResult>) {
        let failureResult = GetItemResult(message: .defaultAlertMessage)
        getItemClient.getItem(with: ItemId) { result in
            switch result {
            case .success(let item):
                guard let item = item else {
                    handler(failureResult)
                    return
                }
                handler(GetItemResult(message: "Success", item: item))
            case .failure(let error):
                handler(failureResult)
            }
        }
    }
    func getItemId() -> String {
        return itemId
    }
}
