//
//  CategoriesProtocols.swift
//  mercadolivre
//

enum ViewStatus {
    case loading
    case loaded
}

// MARK: - View
protocol CategoriesViewProtocol: AnyObject {
    func set(viewStatus: ViewStatus)
}


// MARK: - Interactor
protocol CategoriesInteractorProtocol: AnyObject {
    func requestRootCategories(with handler: @escaping Handler<GetRootCategoriesResult>)
}


// MARK: - Presenter
protocol CategoriesPresenterProtocol: ViewLifecycleable {}
