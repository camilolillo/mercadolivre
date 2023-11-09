//
//  GetItemClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

protocol GetItemProtocol: AnyObject {
    func getItem(with itemId: String, result: @escaping ResultHandler<Item>)
}

final class GetItemClient: BaseClient { }

extension GetItemClient: GetItemProtocol {
    func getItem(with itemId: String, result: @escaping ResultHandler<Item>) {
        request(resource: AppRouter.getItem(itemId), result: result)
    }
}
    
