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
    case GetRootCategories
    case GetChildrenCategories(String)
}

// MARK: - Endpoint
extension AppRouter: Endpoint {


    // MARK: - BaseURL
    var baseURL: URL? {
        switch self {
        case .GetRootCategories, .GetChildrenCategories:
            return AppEnvironment.baseURL
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .GetRootCategories: return "/sites/MLC/categories"
        case .GetChildrenCategories(let id): return "https://api.mercadolibre.com/categories/\(id)"
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
        case .GetRootCategories, .GetChildrenCategories:
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
