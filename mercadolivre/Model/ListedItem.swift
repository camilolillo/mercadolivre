//
//  Item.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

protocol ListedItemCellDataSource: DataSource {
    var name: String { get }
    var imageUrlString: String { get }
}

struct ListedItem: Codable {
    var id: String
    var title: String
    var thumbnail: String?
}

extension ListedItem: ListedItemCellDataSource {
    var name: String {
        return title
    }
    var imageUrlString: String {
        return thumbnail ?? ""
    }
}

