//
//  CategoryCellDataSource.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation

struct RootCategory: Codable {
    var id: String
    var name: String
}

extension RootCategory: CategoryCellDataSource {
    var title: String {
        return name
    }
}
