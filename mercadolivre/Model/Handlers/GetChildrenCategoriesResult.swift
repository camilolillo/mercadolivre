//
//  GetChildrenCategoriesResult.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

struct GetChildrenCategoriesResult {
    var message: String
    var name: String?
    var picture: String?
    var total_items_in_this_category: Int?
    var childrenCategories: [CategoryCellDataSource]?
}
