//
//  GetChildrenCategoriesResult.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

struct GetChildrenCategoriesResult {
    var message: String
    var name: String
    var childrenCategories: [CategoryCellDataSource]?
}
