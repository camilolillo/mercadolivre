//
//  ItemPicture.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

protocol ItemPicturesCellDataSource: DataSource {
    var pictureUrlAsString: String { get }
}

struct ItemPicture: Codable {
    var url: String?
}

extension ItemPicture: ItemPicturesCellDataSource {
    var pictureUrlAsString: String {
        return url ?? ""
    }
}
