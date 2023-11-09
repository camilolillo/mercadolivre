//
//  SearchInteractor.swift
//  mercadolivre
//

// MARK: - SearchInteractor
final class SearchInteractor {
    private var searchClient: SearchClientProtocol
    init(searchClient: SearchClientProtocol) {
        self.searchClient = searchClient
    }
}

// MARK: - SearchInteractorProtocol
extension SearchInteractor: SearchInteractorProtocol {
    func requesItemList(with parameters: SearchParameters, handler: @escaping Handler<GetItemListResult>) {
        let failureResult = GetItemListResult(message: .defaultAlertMessage)
        searchClient.getItemList(with: parameters) { result in
            switch result {
            case .success(let response):
                guard !response.results.isEmpty else {
                    handler(failureResult)
                    return
                }
                handler(GetItemListResult(message: "Success", results: response.results))
            case .failure(let error):
                print(error)
                handler(failureResult)
            }
        }
    }
}
