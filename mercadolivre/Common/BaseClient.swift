//
//  BaseClient.swift
//

import Alamofire

// MARK: - BaseClient
class BaseClient {
    internal var requests = [String: DataRequest]()
}

// MARK: - ClientProtocol
extension BaseClient: ClientProtocol {}
