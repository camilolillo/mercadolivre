//
//  CategoriesPresenter.swift
//  mercadolivre
//

// MARK: - CategoriesPresenter
final class CategoriesPresenter {
    weak var view: CategoriesViewProtocol?
    var interactor: CategoriesInteractorProtocol?
    weak var delegate: CategoriesDelegate?
}

// MARK: - CategoriesPresenterProtocol
extension CategoriesPresenter: CategoriesPresenterProtocol {}


// MARK: - ViewLifecycleable
extension CategoriesPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        interactor?.requestRootCategories() { result in
            print(result)
        }
    }
    func onViewWillAppear() {}
}
