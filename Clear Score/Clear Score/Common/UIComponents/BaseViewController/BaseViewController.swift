//
//  BaseViewController.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/11.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: Attribute(s)
    
    let loadingIndicatorView = LoadingIndicatorView()
    let errorView = ErrorView()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Method(s)
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showActivityIndicator() {
        self.addSubViewAndBringToFront(view: loadingIndicatorView)
        loadingIndicatorView.startLoadingIndicator()
    }
    
    func hideActivityIndiactor() {
        self.loadingIndicatorView.removeFromSuperview()
        self.loadingIndicatorView.stopLoadingIndicator()
    }
    
    func showErrorView(_ title: String,
                       _ subtitle: String,
                       _ retryButtonTitle: String,
                       _ retryAction: Selector,
                       _ retryTarget: Any) {
        self.addSubViewAndBringToFront(view: errorView)
        errorView.showError(title, subtitle: subtitle, retryButtonTitle: retryButtonTitle, target: retryTarget, action: retryAction)
        
    }
    
    func hideErrorView() {
        self.errorView.removeFromSuperview()
    }
    
    func navigateToViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func addSubViewAndBringToFront(view: UIView) {
        if let navigationController = self.navigationController,
           let frame = self.navigationController?.view.frame {
            navigationController.view.addSubview(view)
            view.frame = frame
            navigationController.view.bringSubviewToFront(view)
        } else {
            self.view.addSubview(view)
            view.frame = self.view.frame
            self.view.bringSubviewToFront(view)
        }
    }

}
