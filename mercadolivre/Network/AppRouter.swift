//
//  AppRouter.swift
//  mercadolivre
//
//  Created by Camilo Lillo on 07-11-23.
//

import Foundation
import Alamofire

// MARK: - AppRouter
enum AppRouter {
    case getRootCategories
    case getChildrenCategories(String)
    case getItemsPerChildrenCategory(ParametersConvertible)
    case getItem(String)
}

// MARK: - Endpoint
extension AppRouter: Endpoint {

    // MARK: - BaseURL
    var baseURL: URL? {
        switch self {
        case .getRootCategories, .getChildrenCategories, .getItemsPerChildrenCategory, .getItem:
            return AppEnvironment.baseURL
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .getRootCategories: return "sites/MLC/categories"
        case .getChildrenCategories(let rootCategoryId): return "categories/\(rootCategoryId)"
        case .getItemsPerChildrenCategory: return "sites/MLC/search"
        case .getItem(let itemId): return "items/\(itemId)"
        }
    }

    // MARK: - Headers
    var headers: HTTPHeaders {
        var headers = HTTPHeaders()
        switch self {
        default:
            headers.add(.contentType("application/json"))
        }
        return headers
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getRootCategories, .getChildrenCategories, .getItemsPerChildrenCategory, .getItem:
            return .get
        }
    }

    // MARK: - Parameters
    var parameters: Parameters {
        switch self {
        case .getItemsPerChildrenCategory(let parameters):
            return parameters.asParameters
        default:
            return [:]
        }
    }
}

// MARK: - URLRequestConvertible
extension AppRouter: URLRequestConvertible {}
