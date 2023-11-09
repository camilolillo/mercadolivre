//
//  SearchedItemListRequestable.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

protocol SearchedItemListRequestable: AnyObject {
    func onSearchedItemListRequested(items: [Item])
}
