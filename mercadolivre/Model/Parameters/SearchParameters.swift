//
//  SearchParameters.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation
import Alamofire

// MARK: - AppleAuthParameters
struct SearchParameters: ParametersConvertible {
    var searchKey: String

    var asParameters: Parameters {
        [
            "q": searchKey
        ]
    }
}
