//
//  GetItemListPerChildrenCategoryParameters.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation
import Alamofire

// MARK: - AppleAuthParameters
struct GetItemListPerChildrenCategoryParameters: ParametersConvertible {
    var childrenCategoryId: String

    var asParameters: Parameters {
        [
            "category": childrenCategoryId
        ]
    }
}
