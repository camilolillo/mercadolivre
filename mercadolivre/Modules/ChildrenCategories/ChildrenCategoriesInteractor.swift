//
//  ChildrenCategoriesInteractor.swift
//  mercadolivre
//

// MARK: - ChildrenCategoriesInteractor
final class ChildrenCategoriesInteractor {
    private let getChildrenCategoriesClient: GetChildrenCategoriesClientProtocol
    init(getChildrenCategoriesClient: GetChildrenCategoriesClientProtocol) {
        self.getChildrenCategoriesClient = getChildrenCategoriesClient
    }
}

// MARK: - ChildrenCategoriesInteractorProtocol
extension ChildrenCategoriesInteractor: ChildrenCategoriesInteractorProtocol {
    func requestRootCategories(with childrenCategoryId: String, handler: @escaping Handler<GetRootCategoriesResult>) {
        getChildrenCategoriesClient.getChildrenCategories(with: childrenCategoryId) { result in
            switch result {
            case .success(<#T##[ChildrenCategory]#>)
            }
        }
    }
}
