//
//  ItemViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - ItemViewController
final class ItemViewController: BaseViewController {
    var presenter: ItemPresenterProtocol?
    
    private var item: Item? {
        didSet {
            guard let item else { return }
            title = item.title
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .purple
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fillProportionally
        view.alignment = .center
        view.backgroundColor = .green
        return view
    }()
    
    
    
}

// MARK: - Lifecycle
extension ItemViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(testView)
        
        NSLayoutConstraint.activate (
            [
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ]
        )
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - ItemViewProtocol
extension ItemViewController: ItemViewProtocol {
    func set(loadingStatus: LoadingStatus) {
        //TODO
    }
    func set(item: Item) {
        self.item = item
    }
    func reloadData() {
        //TODO
    }
}
