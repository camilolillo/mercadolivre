//
//  ListedItemsViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - ListedItemsViewController
final class ListedItemsViewController: BaseViewController {
    var presenter: ListedItemsPresenterProtocol?
}

// MARK: - Lifecycle
extension ListedItemsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - ListedItemsViewProtocol
extension ListedItemsViewController: ListedItemsViewProtocol {}
