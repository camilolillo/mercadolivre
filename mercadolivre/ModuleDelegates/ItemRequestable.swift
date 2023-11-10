//
//  ItemRequestable.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

protocol ItemRequestable: AnyObject {
    func onItemDetailRequested(with itemId: String)
}
