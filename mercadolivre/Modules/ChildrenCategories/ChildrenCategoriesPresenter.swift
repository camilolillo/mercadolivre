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
    func onItemSelected(indexPath: IndexPath) {
        guard let rootCategory = dataSource?[indexPath.row] as? ChildrenCategory else {
            return
        }
        print(rootCategory.id)
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
    func onViewDidLoad() {}
    func onViewWillAppear() {}
}
