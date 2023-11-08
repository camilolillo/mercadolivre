//
//  RootCategoryCell.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation
import UIKit

protocol RootCategoryDataSource: DataSource {
    var title: String { get }
}

final class RootCategoryCell: DataSourceableCell {
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
        
    var dataSource: RootCategoryDataSource? {
        didSet {
            guard let dataSource else { return }
            title.text = dataSource.title
        }
    }
    
}
