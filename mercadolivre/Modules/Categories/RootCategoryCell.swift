//
//  RootCategoryCell.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation
import UIKit

protocol NewItemCellDataSource: DataSource {
    var imageUrl: String? { get }
    var text: String? { get }
    var title: String? { get }
}

final class NewCell: DataSourceableCell {
        
    var dataSource: NewItemCellDataSource? {
        didSet {
            
        }
    }
    
}
