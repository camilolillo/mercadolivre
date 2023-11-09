//
//  SearchViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - SearchViewController
final class SearchViewController: BaseViewController {
    var presenter: SearchPresenterProtocol?
    
    private lazy var searchField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.systemGray.withAlphaComponent(0.6).cgColor
        field.layer.cornerRadius = 12
        field.placeholder = .searchPlaceholder
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: field.frame.height))
        field.leftView = padding
        field.leftViewMode = .always
        return field
    }()
    
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
        
        view.addSubview(searchField)
        
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchField.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
}

// MARK: - SearchViewProtocol
extension SearchViewController: SearchViewProtocol {}
