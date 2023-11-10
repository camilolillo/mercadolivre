//
//  CategoriesPresenter.swift
//  mercadolivre
//

import UIKit

// MARK: - CategoriesPresenter
final class RootCategoriesPresenter {
    weak var view: RootCategoriesViewProtocol?
    var interactor: RootCategoriesInteractorProtocol?
    weak var delegate: RootCategoriesDelegate?
    
    private var dataSource: [CategoryCellDataSource]? {
        didSet {
            view?.reloadData()
        }
    }
}

// MARK: - CategoriesPresenterProtocol
extension RootCategoriesPresenter: RootCategoriesPresenterProtocol {
    func onItemSelected(indexPath: IndexPath) {
        guard let rootCategory = dataSource?[indexPath.row] as? RootCategory else {
            return
        }
        delegate?.onChildrenCategoriesModuleRequested(with: rootCategory.id)
    }
}

// MARK: - ViewLifecycleable
extension RootCategoriesPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        view?.set(loadingStatus: .loading)
        interactor?.requestRootCategories() { result in
            guard let data = result.rootCategories else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(loadingStatus: .loaded) }, cancelHandler: nil
                )
                return
            }
            self.dataSource = data
            self.view?.set(loadingStatus: .loaded)
        }
    }
    func onViewWillAppear() {}
}
//MARK: - CollectionViewable
extension RootCategoriesPresenter: CollectionViewable {
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
        return (width: view!.screenWidth-24, height: 58)
    }
}
