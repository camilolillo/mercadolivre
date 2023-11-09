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
    case getItemsPerChildrenCategory(String)
}

// MARK: - Endpoint
extension AppRouter: Endpoint {


    // MARK: - BaseURL
    var baseURL: URL? {
        switch self {
        case .getRootCategories, .getChildrenCategories, .getItemsPerChildrenCategory:
            return AppEnvironment.baseURL
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .getRootCategories: return "sites/MLC/categories"
        case .getChildrenCategories(let rootCategoryId): return "categories/\(rootCategoryId)"
        case .getItemsPerChildrenCategory(let childrenCategoryId): return "sites/MLC/search?category=\(childrenCategoryId)"
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
        case .getRootCategories, .getChildrenCategories, .getItemsPerChildrenCategory:
            return .get
        }
    }

    // MARK: - Parameters
    var parameters: Parameters {
        switch self {
        default:
            return [:]
        }
    }
}

// MARK: - URLRequestConvertible
extension AppRouter: URLRequestConvertible {}
