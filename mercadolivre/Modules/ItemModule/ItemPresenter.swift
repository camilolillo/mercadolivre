//
//  ItemPresenter.swift
//  mercadolivre
//

// MARK: - ItemPresenter
final class ItemPresenter {
    weak var view: ItemViewProtocol?
    var interactor: ItemInteractorProtocol?
    weak var delegate: ItemDelegate?
    
    private var picturesDataSource: [ItemPicturesCellDataSource]? {
        didSet {
            view?.reloadData()
        }
    }
    
}

// MARK: - ItemPresenterProtocol
extension ItemPresenter: ItemPresenterProtocol {}

// MARK: - ViewLifecycleable
extension ItemPresenter: ViewLifecycleable {
    func onViewDidLoad() {
        interactor?.getItem(with: interactor?.getItemId() ?? "") { result in
            guard let item = result.item else {
                self.delegate?.onPresentAlertRequested(
                    title: "",
                    message: result.message,
                    handler: { self.view?.set(loadingStatus: .loaded) },
                    cancelHandler: nil
                )
                return
            }
            self.view?.set(item: item)
            self.picturesDataSource = item.pictures
        }
    }
    func onViewWillAppear() {}
}
//MARK: - CollectionViewable
extension ItemPresenter: CollectionViewable {
    func getNumberOfItems(in section: Int) -> Int {
        return picturesDataSource?.count ?? 0
    }
    func onCellForItem(in section: Int, at index: Int) -> DataSource? {
        return picturesDataSource?[index]
    }
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String {
        return ItemPicturesCell.reuseIdentifier
    }
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double) {
        return (width: view!.screenWidth, height: 500)
    }
}
