//
//  GetItemListPerChildrenCategoryClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

protocol GetItemListPerChildrenCategoryClientProtocol: AnyObject {
    func getItemList(with parameters: GetItemListPerChildrenCategoryParameters, result: @escaping ResultHandler<GetItemListPerChildrenCategoryResponse>)
}

final class GetItemListPerChildrenCategoryClient: BaseClient { }

extension GetItemListPerChildrenCategoryClient: GetItemListPerChildrenCategoryClientProtocol {
    func getItemList(with parameters: GetItemListPerChildrenCategoryParameters, result: @escaping ResultHandler<GetItemListPerChildrenCategoryResponse>) {
        request(resource: AppRouter.getItemsPerChildrenCategory(parameters), result: result)
    }
}
