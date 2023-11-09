//
//  ChildrenCategoriesPresenter.swift
//  mercadolivre
//

import UIKit

// MARK: - ChildrenCategoriesPresenter
final class ChildrenCategoriesPresenter {
    weak var view: ChildrenCategoriesViewProtocol?
    var interactor: ChildrenCategoriesInteractorProtocol?
    weak var delegate: ChildrenCategoriesDelegate?
    
    private var dataSource: [CategoryCellDataSource]? {
        didSet {
            view?.reloadData()
        }
    }
}

// MARK: - ChildrenCategoriesPresenterProtocol
extension ChildrenCategoriesPresenter: ChildrenCategoriesPresenterProtocol {
    func onBackButtonPressed() {
        delegate?.onGoBackRequested()
    }
    func onSearchButtonPressed() {
        delegate?.onSearchItemRequested() 
    }
}
//MARK: - CollectionViewable
extension ChildrenCategoriesPresenter {
    func onItemSelected(indexPath: IndexPath) {
        guard let childrenCategory = dataSource?[indexPath.row] as? ChildrenCategory else {
            return
        }
        delegate?.onItemListRequested(with: childrenCategory.id)
    }
    func getNumberOfItems(in section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    func onCellForItem(in section: Int, at index: Int) -> DataSource? {
        return dataSource?[index]
    }
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String {
        return ChildrenCategoryCell.reuseIdentifier
    }
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double) {
        return (width: view!.screenWidth-24, height: 58)
    }
}
// MARK: - ViewLifecycleable
extension ChildrenCategoriesPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        view?.set(loadingStatus: .loading)
        interactor?.requestChildrentCategories(with: interactor?.getRootCategoryId() ?? "") { result in
            guard let data = result.childrenCategories else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(loadingStatus: .loaded) }, cancelHandler: nil
                )
                return
            }
            self.dataSource = data
            if let name = result.name, let imageUrlAsString = result.picture {
                let values = ChildrenCategoriesValues(
                    name: name,
                    imageStringUrl: imageUrlAsString
                )
                self.view?.set(values: values)
                self.view?.set(loadingStatus: .loaded)
            } else {
                self.view?.set(loadingStatus: .loaded)
            }
        }
    }
    func onViewWillAppear() {}
}
