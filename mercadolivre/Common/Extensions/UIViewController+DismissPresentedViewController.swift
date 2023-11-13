//
//  UIViewController+DismissPresentedViewController.swift
//

import UIKit

// MARK: - Dismiss Presented ViewController
extension UIViewController {
    func dismissPresentedViewController(animated: Bool = true, completion: CompletionHandler) {
        guard
            isPresenting,
            let presentedViewController = presentedViewController
        else {
            completion?()
            return
        }

        guard presentedViewController.isPresenting else {
            presentedViewController.dismiss(animated: animated, completion: completion)
            return
        }

        presentedViewController.dismissPresentedViewController(completion: completion)
    }
}
