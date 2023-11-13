//
//  HTTPService.swift
//

import Alamofire

// MARK: - HTTPService
enum HTTPService {}

extension HTTPService {
    private static var appCoordinator: AppCoordinator? { (UIApplication.shared.delegate as? AppDelegate)?.appCoordinator }
}

extension HTTPService {
    @discardableResult static func request<T: Decodable>(resource: URLRequestConvertible, result: @escaping ResultHandler<T>) -> DataRequest {
        var jsonDecoder: JSONDecoder { .init() }
        return AF
            .request(resource)
            .responseDecodable(decoder: jsonDecoder) { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let decodedObject):
                    result(.success(decodedObject))
                case .failure(let error):
                    result(.failure(error))
                }
            }
    }
}
