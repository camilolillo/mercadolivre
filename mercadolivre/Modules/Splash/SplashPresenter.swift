//
//  SplashPresenter.swift
//  mercadolivre
//

// MARK: - SplashPresenter
final class SplashPresenter {
    weak var view: SplashViewProtocol?
    var interactor: SplashInteractorProtocol?
    weak var delegate: SplashDelegate?
}

// MARK: - SplashPresenterProtocol
extension SplashPresenter: SplashPresenterProtocol {}


// MARK: - ViewLifecycleable
extension SplashPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        
        let client = GetProductRootCategoriesClient()
        client.getProductRootCategories() { response in
            print(response)
        }
        
    }
    func onViewWillAppear() {}
}
