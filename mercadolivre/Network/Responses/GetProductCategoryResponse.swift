//
//  ProductCategoryResponse.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation

struct GetProductCategoryResponse: Codable {
    let productRootCategories: [ProductRootCategory]
}
