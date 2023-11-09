//
//  GetRootCategoriesClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation

protocol GetRootCategoriesClientProtocol: AnyObject {
    func getProductRootCategories(with result: @escaping ResultHandler<[RootCategory]>)
}

final class GetRootCategoriesClient: BaseClient { }

extension GetRootCategoriesClient: GetRootCategoriesClientProtocol {
    func getProductRootCategories(with result: @escaping ResultHandler<[RootCategory]>) {
        request(resource: AppRouter.getRootCategories, result: result)
    }
}
