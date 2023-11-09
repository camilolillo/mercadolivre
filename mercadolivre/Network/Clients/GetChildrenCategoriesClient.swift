//
//  GetChildrenCategoriesClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

protocol GetChildrenCategoriesClientProtocol: AnyObject {
    func getChildrenCategories(with childrenCategoryId: String, result: @escaping ResultHandler<GetChildrenCategoriesResponse>)
}

final class GetChildrenCategoriesClient: BaseClient { }

extension GetChildrenCategoriesClient: GetChildrenCategoriesClientProtocol {
    func getChildrenCategories(with childrenCategoryId: String, result: @escaping ResultHandler<GetChildrenCategoriesResponse>) {
        request(resource: AppRouter.GetChildrenCategories(childrenCategoryId), result: result)
    }
}
