//
//  GetChildrenCategoriesResponse.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

struct GetChildrenCategoriesResponse: Codable {
    var id: String
    var name: String
    var picture: String
    var total_items_in_this_category: Int
    var children_categories: [ChildrenCategory]
}
