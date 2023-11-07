//
//  GetProdutcRootCategoriesClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation

protocol GetDocumentsInfoContentProtocol: AnyObject {
    func getDocumentsInfoContent(with result: @escaping ResultHandler<GetProductCategoryResponse>)
}

final class GetDocumentsInfoContentClient: BaseClient { }

extension GetDocumentsInfoContentClient: GetDocumentsInfoContentProtocol {
    func getDocumentsInfoContent(with result: @escaping ResultHandler<GetProductCategoryResponse>) {
        request(resource: AppRouter.GetProductRootCategories, result: result)
    }
}
