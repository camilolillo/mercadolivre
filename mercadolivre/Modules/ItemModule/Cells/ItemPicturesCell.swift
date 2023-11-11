//
//  ItemPicturesCell.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 10-11-23.
//

import Foundation
import UIKit
import Kingfisher

final class ItemPicturesCell: DataSourceableCell {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.color = .systemBlue
        return view
    }()
        
    var dataSource: ItemPicturesCellDataSource? {
        didSet {
            if let url = URL(string: dataSource?.pictureUrlAsString ?? "") {
                imageView.kf.setImage(with: url)
            } else {
                imageView.image = UIImage(named: "main_logo")
            }
        }
    }
    
    override func setupCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(activityIndicator)
        contentView.addSubview(imageView)
        
        activityIndicator.startAnimating()
                        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 400),
            imageView.widthAnchor.constraint(equalToConstant: 400),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    
    }
}
