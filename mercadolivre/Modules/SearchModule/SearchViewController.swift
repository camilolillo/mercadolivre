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
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Buscar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(onSearchButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    @objc func onSearchButtonPressed(sender: UIButton) {
        presenter?.onSearchButtonPressed(key: searchField.text)
    }
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
        view.addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            searchField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchField.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalTo: searchField.widthAnchor),
            searchButton.heightAnchor.constraint(equalTo: searchField.heightAnchor),
            searchButton.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 12),
            searchButton.centerXAnchor.constraint(equalTo: searchField.centerXAnchor)
        ])
    }
}

// MARK: - SearchViewProtocol
extension SearchViewController: SearchViewProtocol {}
