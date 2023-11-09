//
//  ChildrenCategoriesInteractor.swift
//  mercadolivre
//

// MARK: - ChildrenCategoriesInteractor
final class ChildrenCategoriesInteractor {
    private let getChildrenCategoriesClient: GetChildrenCategoriesClientProtocol
    private let rootCategoryId: String
    init(getChildrenCategoriesClient: GetChildrenCategoriesClientProtocol, rootCategoryId: String) {
        self.getChildrenCategoriesClient = getChildrenCategoriesClient
        self.rootCategoryId = rootCategoryId
    }
}

// MARK: - ChildrenCategoriesInteractorProtocol
extension ChildrenCategoriesInteractor: ChildrenCategoriesInteractorProtocol {
    func requestChildrentCategories(with rootCategoryId: String, handler: @escaping Handler<GetChildrenCategoriesResult>) {
        let failureResult = GetChildrenCategoriesResult(message: .defaultAlertMessage)
        getChildrenCategoriesClient.getChildrenCategories(with: rootCategoryId) { result in
            switch result {
            case .success(let response):
                guard !response.children_categories.isEmpty else {
                    handler(failureResult)
                    return
                }
                let result = GetChildrenCategoriesResult(
                    message: "Success",
                    name: response.name,
                    picture: response.picture,
                    total_items_in_this_category: response.total_items_in_this_category,
                    childrenCategories: response.children_categories
                )
                handler(result)
            case .failure(let error):
                print(error)
                handler(failureResult)
            }
        }
    }
    func getRootCategoryId() -> String {
        return rootCategoryId
    }
}
