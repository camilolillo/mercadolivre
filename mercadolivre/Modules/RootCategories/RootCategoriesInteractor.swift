//
//  CategoriesInteractor.swift
//  mercadolivre
//

// MARK: - CategoriesInteractor
final class RootCategoriesInteractor {
    private let categoriesClient: GetRootCategoriesClientProtocol
    init(categoriesClient: GetRootCategoriesClientProtocol) {
        self.categoriesClient = categoriesClient
    }
}

// MARK: - CategoriesInteractorProtocol
extension RootCategoriesInteractor: RootCategoriesInteractorProtocol {
    func requestRootCategories(with handler: @escaping Handler<GetRootCategoriesResult>) {
        categoriesClient.getProductRootCategories() { result in
            switch result {
            case .success(let response):
                guard !response.isEmpty else {
                    handler(GetRootCategoriesResult(message: .noRootCategoriesMessage))
                    return
                }
                handler(GetRootCategoriesResult(message: "Success", rootCategories: response))
            case .failure(let error):
                handler(GetRootCategoriesResult(message: .defaultAlertMessage))
            }
        }
    }
}
