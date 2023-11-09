//
//  ItemViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - ItemViewController
final class ItemViewController: BaseViewController {
    var presenter: ItemPresenterProtocol?
}

// MARK: - Lifecycle
extension ItemViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        view.backgroundColor = .yellow
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - ItemViewProtocol
extension ItemViewController: ItemViewProtocol {}
