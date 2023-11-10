//
//  ItemPicturesCell.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 10-11-23.
//

import Foundation
import UIKit
import Kingfisher

protocol ItemPicturesCellDataSource: DataSource {
    var pictures: [ItemPicture] { get }
}

final class ItemPicturesCell: DataSourceableCell {
        
    var dataSource: ItemPicturesCellDataSource? {
        didSet {
            
        }
    }
    
    override func setupCell() {

    }
}
