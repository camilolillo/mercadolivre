//
//  SplashViewController.swift
//  mercadolivre
//

import UIKit

// MARK: - SplashViewController
final class SplashViewController: BaseViewController {
    var presenter: SplashPresenterProtocol?
    
    private lazy var mainImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "main_logo")
        return view
    }()
}

// MARK: - Lifecycle
extension SplashViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter?.onViewDidLoad()
        
        view.addSubview(mainImage)
        
        NSLayoutConstraint.activate([
            mainImage.widthAnchor.constraint(equalToConstant: 200),
            mainImage.heightAnchor.constraint(equalToConstant: 200),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onViewWillAppear()
    }
}

// MARK: - SplashViewProtocol
extension SplashViewController: SplashViewProtocol {}
