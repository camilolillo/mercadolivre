//
//  SearchClient.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

import Foundation

protocol SearchClientProtocol: AnyObject {
    func getItemList(with parameters: SearchParameters, result: @escaping ResultHandler<GetItemListResponse>)
}

final class SearchClient: BaseClient { }

extension SearchClient: SearchClientProtocol {
    func getItemList(with parameters: SearchParameters, result: @escaping ResultHandler<GetItemListResponse>) {
        request(resource: AppRouter.search(parameters), result: result)
    }
}
