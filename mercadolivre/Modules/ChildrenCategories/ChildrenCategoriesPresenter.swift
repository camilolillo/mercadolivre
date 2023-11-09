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
    func onItemSelected(indexPath: IndexPath) {
        guard let childrenCategory = dataSource?[indexPath.row] as? ChildrenCategory else {
            return
        }
        print(childrenCategory)
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
        interactor?.requestRootCategories(with: interactor?.getChildrenCategoryId() ?? "") { result in
            guard let data = result.childrenCategories else {
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
