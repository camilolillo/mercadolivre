//
//  CategoriesInteractor.swift
//  mercadolivre
//

// MARK: - CategoriesInteractor
final class RootCategoriesInteractor {
    private let categoriesClient: GetProductRootCategoriesClientProtocol
    init(categoriesClient: GetProductRootCategoriesClientProtocol) {
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
                print(error)
                handler(GetRootCategoriesResult(message: .defaultAlertMessage))
            }
        }
    }
}
