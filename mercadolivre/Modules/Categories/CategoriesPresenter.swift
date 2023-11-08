//
//  CategoriesPresenter.swift
//  mercadolivre
//

// MARK: - CategoriesPresenter
final class CategoriesPresenter {
    weak var view: CategoriesViewProtocol?
    var interactor: CategoriesInteractorProtocol?
    weak var delegate: CategoriesDelegate?
    
    private var dataSource: [RootCategoryDataSource]? {
        didSet {
            guard let dataSource else { return }
            view?.reloadData()
        }
    }
}

// MARK: - CategoriesPresenterProtocol
extension CategoriesPresenter: CategoriesPresenterProtocol {}

// MARK: - ViewLifecycleable
extension CategoriesPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        interactor?.requestRootCategories() { result in
            guard let data = result.rootCategories else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(viewStatus: .loaded) }, cancelHandler: nil
                )
                return
            }
            self.dataSource = data
        }
    }
    func onViewWillAppear() {}
}
//MARK: - CollectionViewable
extension CategoriesPresenter: CollectionViewable {
    func getNumberOfItems(in section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    func onCellForItem(in section: Int, at index: Int) -> DataSource? {
        return dataSource?[index]
    }
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String {
        return RootCategoryCell.reuseIdentifier
    }
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double) {
        return (width: view!.screenWidth-48, height: 58)
    }
}
