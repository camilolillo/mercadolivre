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
}

// MARK: - ChildrenCategoriesPresenterProtocol
extension ChildrenCategoriesPresenter: ChildrenCategoriesPresenterProtocol {
    func onItemSelected(indexPath: IndexPath) {
        <#code#>
    }
    func getNumberOfItems(in section: Int) -> Int {
        <#code#>
    }
    func onCellForItem(in section: Int, at index: Int) -> DataSource? {
        <#code#>
    }
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String {
        <#code#>
    }
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double) {
        <#code#>
    }
}


// MARK: - ViewLifecycleable
extension ChildrenCategoriesPresenter: ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
}
