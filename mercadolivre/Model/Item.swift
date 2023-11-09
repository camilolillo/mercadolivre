//
//  Item.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

import Foundation

struct Item: Codable {
    var id: String
    var title: String
    var subtitle: String?
    var price: Int
    var pictures: [ItemPicture]
}
