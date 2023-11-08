//
//  ChildrenCategoryCell.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation
import UIKit

final class ChildrenCategoryCell: DataSourceableCell {
    
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        return label
    }()
        
    var dataSource: CategoryCellDataSource? {
        didSet {
            guard let dataSource else { return }
            title.text = dataSource.title
        }
    }
    
    override func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.addSubview(title)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
