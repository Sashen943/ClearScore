//
//  LoadingIndicatorView.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import UIKit

class LoadingIndicatorView: UIView {
    
    // MARK: Attribute(s)
    
    private let nibName = "LoadingIndicatorView"
    
    // MARK: IBOutlet(s)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
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
        Bundle.main.loadNibNamed(nibName,
                                 owner: self,
                                 options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    public func startLoadingIndicator() {
        self.activityIndicator.startAnimating()
    }
    
    public func stopLoadingIndicator() {
        self.activityIndicator.stopAnimating()
    }
    
}
