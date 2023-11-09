//
//  ItemListPerChildrenCategoryRequestable.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 08-11-23.
//

import Foundation

protocol ItemListPerChildrenCategoryRequestable: AnyObject {
    func onItemListRequested(with childrenCategoryId: String)
}
