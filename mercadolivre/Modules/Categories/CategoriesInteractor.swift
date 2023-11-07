//
//  CategoriesInteractor.swift
//  mercadolivre
//

struct CategoriesResult {
    
}

// MARK: - CategoriesInteractor
final class CategoriesInteractor {
    private let categoriesClient: GetProductRootCategoriesClientProtocol
    init(categoriesClient: GetProductRootCategoriesClientProtocol) {
        self.categoriesClient = categoriesClient
    }
}

// MARK: - CategoriesInteractorProtocol
extension CategoriesInteractor: CategoriesInteractorProtocol {}
