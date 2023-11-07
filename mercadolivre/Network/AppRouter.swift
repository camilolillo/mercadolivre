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
    case GetProductRootCategories
}

// MARK: - Endpoint
extension AppRouter: Endpoint {


    // MARK: - BaseURL
    var baseURL: URL? {
        switch self {
        case .GetProductRootCategories:
            return AppEnvironment.baseURL
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .GetProductRootCategories: return "/api/auth/register"
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
        case .GetProductRootCategories:
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
