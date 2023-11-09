//
//  SearchViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - SearchViewController
final class SearchViewController: BaseViewController {
    var presenter: SearchPresenterProtocol?
}

// MARK: - Lifecycle
extension SearchViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        view.backgroundColor = .white
        title = "Búsqueda"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - SearchViewProtocol
extension SearchViewController: SearchViewProtocol {}
