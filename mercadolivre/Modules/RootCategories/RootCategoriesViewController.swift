//
//  CategoriesViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - CategoriesViewController
final class RootCategoriesViewController: BaseViewController {
    var presenter: RootCategoriesPresenterProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(RootCategoryCell.self)
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
extension RootCategoriesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
        title = "Categorías"
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}
//MARK: - Methods
extension RootCategoriesViewController {
    func setupNavigationBar() {
        navigationItem.setHidesBackButton(true, animated: false)
        let searchButton = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .plain,
            target: self,
            action: #selector(onSearchButtonPressed)
        )
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let activityIndicatorItem = UIBarButtonItem(customView: activityIndicator)
        navigationItem.rightBarButtonItems = [activityIndicatorItem, flexibleSpace, searchButton]
        navigationItem.setHidesBackButton(true, animated: false)
    }
}
//MARK: - Functions
extension RootCategoriesViewController {
    @objc func onSearchButtonPressed(sender: UIButton) {
        presenter?.onSearchButtonPressed()
    }
}
// MARK: - CategoriesViewProtocol
extension RootCategoriesViewController: RootCategoriesViewProtocol {
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

// MARK: - UICollectionViewDataSource
extension RootCategoriesViewController: UICollectionViewDataSource {
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
        presenter?.onItemSelected(indexPath: indexPath)
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension RootCategoriesViewController: UICollectionViewDelegateFlowLayout {
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
