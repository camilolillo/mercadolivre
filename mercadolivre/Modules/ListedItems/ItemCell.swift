//
//  ItemCell.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation
import UIKit
import Kingfisher

final class ItemCell: DataSourceableCell {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = view.frame.size.width / 2
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "main_logo")
        return view
    }()
        
    var dataSource: ItemCellDataSource? {
        didSet {
            guard let dataSource else { return }
            title.text = dataSource.name
            if let url = URL(string: dataSource.imageUrlString) {
                imageView.kf.setImage(with: url)
            }
        }
    }
    
    override func setupCell() {
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.addSubview(title)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            title.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            imageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
