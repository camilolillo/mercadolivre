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
            itemTitle.text = item.title
            itemSubtitle.text = item.subtitle
            itemPrice.text = item.price.intToStringAsCLP()
        }
    }
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fillProportionally
        view.alignment = .center
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ChildrenCategoryCell.self, forCellWithReuseIdentifier: ChildrenCategoryCell.reuseIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .yellow
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var itemSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fillProportionally
        view.alignment = .center
        return view
    }()
    
    private lazy var itemPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        
        stackView.addArrangedSubview(collectionView)
        
        titleStackView.addArrangedSubview(itemTitle)
        titleStackView.addArrangedSubview(itemSubtitle)
        stackView.addArrangedSubview(titleStackView)
        
        stackView.addArrangedSubview(itemPrice)
        
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
                stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 500),
                itemTitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6),
                itemSubtitle.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.6)
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
        collectionView.reloadData()
    }
}
// MARK: - UICollectionViewDataSource
extension ItemViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { presenter?.getNumberOfSections() ?? 0 }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { presenter?.getNumberOfItems(in: section) ?? 0 }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryIndex = indexPath.section
        let reuseIdentifier = presenter?.onReuseIdentifierRequested(in: categoryIndex, at: indexPath.item) ?? ""
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)

        if
            let dataSourceable = cell as? any DataSourceable,
            let dataSource = presenter?.onCellForItem(in: categoryIndex, at: indexPath.item)
        {
            dataSourceable.set(dataSource: dataSource)
        }

        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout
extension ItemViewController: UICollectionViewDelegateFlowLayout {
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
