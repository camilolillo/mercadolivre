//
//  GetProdutcRootCategoriesClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation

protocol GetProductRootCategoriesClientProtocol: AnyObject {
    func getProductRootCategories(with result: @escaping ResultHandler<GetProductCategoryResponse>)
}

final class GetProductRootCategoriesClient: BaseClient { }

extension GetProductRootCategoriesClient: GetProductRootCategoriesClientProtocol {
    func getProductRootCategories(with result: @escaping ResultHandler<GetProductCategoryResponse>) {
        request(resource: AppRouter.GetProductRootCategories, result: result)
    }
}
