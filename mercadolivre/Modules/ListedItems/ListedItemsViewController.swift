//
//  ListedItemsViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - ListedItemsViewController
final class ListedItemsViewController: BaseViewController {
    var presenter: ListedItemsPresenterProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemCell.self)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .yellow
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.stopAnimating()
        return view
    }()
}

// MARK: - Lifecycle
extension ListedItemsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        
        view.backgroundColor = .yellow
        setupNavigationBar()
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - ListedItemsViewProtocol
extension ListedItemsViewController: ListedItemsViewProtocol {
    func set(loadingStatus: LoadingStatus) {
        switch loadingStatus {
        case .loading:
            activityIndicator.startAnimating()
        case .loaded:
            activityIndicator.stopAnimating()
        }
    }
    func reloadData() {
        collectionView.reloadData()
    }
}
//MARK: - Methods
extension ListedItemsViewController {
    func setupNavigationBar() {
        let barButtonItem = UIBarButtonItem(
            image: .init(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(onBackButtonPressed(sender:))
        )
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
        let activityIndicatorItem = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItem = activityIndicatorItem
    }
}
//MARK: - Functions
extension ListedItemsViewController {
    @objc func onBackButtonPressed(sender: UIButton) {
        presenter?.onBackButtonPressed()
    }
}

// MARK: - UICollectionViewDataSource
extension ListedItemsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { presenter?.getNumberOfSections() ?? 0 }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { presenter?.getNumberOfItems(in: section) ?? 0 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryIndex = indexPath.section
        let reuseIdentifier = presenter?.onReuseIdentifierRequested(in: categoryIndex, at: indexPath.item) ?? ""
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        if
            let dataSourceable = cell as? any DataSourceable,
            let dataSource = presenter?.onCellForItem(in: categoryIndex, at: indexPath.item)
        { dataSourceable.set(dataSource: dataSource) }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //TODO
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListedItemsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case presenter?.getNumberOfSections():
            return .init(top: .zero, left: .zero, bottom: 20, right: .zero)
        default: return .zero
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = presenter?.onSizeForHeaderItem(in: section)
        let width = size?.width
        let height = size?.height
        return .init(width: width ?? 0, height: height ?? 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = presenter?.onSizeForItem(in: indexPath.section, at: indexPath.item)
        let width = size?.width
        let height = size?.height
        return .init(width: width ?? 0, height: height ?? 0)
    }
}
