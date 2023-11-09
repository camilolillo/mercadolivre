//
//  SearchItemRequestable.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 09-11-23.
//

import Foundation

import Foundation

protocol SearchItemRequestable: AnyObject {
    func onSearchItemRequested(with handler: CompletionHandler)
}
