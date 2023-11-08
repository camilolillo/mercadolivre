//
//  ProductSubcategory.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

import Foundation

struct ChildrenCategory: Codable {
    var id: String
    var name: String
    var total_items_in_this_category: Int
}

extension ChildrenCategory: CategoryCellDataSource {
    var title: String {
        return name
    }
}
