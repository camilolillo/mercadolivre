//
//  Item.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

protocol ItemCellDataSource {
    var name: String { get }
    var imageUrlString: String { get }
}

struct Item: Codable {
    var id: String
    var title: String
    var thumbnail: String?
}

extension Item: ItemCellDataSource {
    var name: String {
        return title
    }
    var imageUrlString: String {
        return thumbnail ?? ""
    }
}

