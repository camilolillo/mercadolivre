//
//  CategoriesViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - CategoriesViewController
final class CategoriesViewController: BaseViewController {
    var presenter: CategoriesPresenterProtocol?
}

// MARK: - Lifecycle
extension CategoriesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        title = "Categorías"
        view.backgroundColor = .white
        setupNavigationBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}
//MARK: - Methods
extension CategoriesViewController {
    func setupNavigationBar() {
        navigationItem.setHidesBackButton(true, animated: false)
    }
}

// MARK: - CategoriesViewProtocol
extension CategoriesViewController: CategoriesViewProtocol {
    func set(viewStatus: ViewStatus) {
        //TODO
    }
}
