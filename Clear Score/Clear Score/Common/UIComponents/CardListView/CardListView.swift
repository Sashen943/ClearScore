//
//  CardListView.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import UIKit

class CardListView: UIView {
    
    // MARK: Attribute(s)
    
    private let nibName = "CardListView"

    // MARK: IBOutlet(s)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
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
    
    func configureCard(_ title: String, _ description: String) {
        self.cardView.makeLightCard()
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
    
    
}
