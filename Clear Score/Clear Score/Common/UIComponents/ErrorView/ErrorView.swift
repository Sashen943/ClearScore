//
//  ErrorView.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import UIKit

class ErrorView: UIView {
    
    // MARK: Attribute(s)
    
    private let nibName = "ErrorView"
    
    // MARK: IBOutlet(s)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    // MARK: Constructor(s)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialiseView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialiseView()
    }
    
    // MARK: Method(s)
    
    private func initialiseView() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    
    public func showError(_ title: String, subtitle: String, retryButtonTitle: String, target: Any, action: Selector) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.retryButton.setTitle(retryButtonTitle, for: .normal)
        self.addDismissAction()
        self.retryButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    @objc func addDismissAction() {
        self.retryButton.addTarget(self, action: #selector(self.dismissAction), for: .touchUpInside)
    }
    
    @objc func dismissAction() {
        self.removeFromSuperview()
    }
}
