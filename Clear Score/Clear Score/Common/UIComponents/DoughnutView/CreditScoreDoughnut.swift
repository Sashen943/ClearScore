//
//  CreditScoreDoughnut.swift
//  Clear Score
//
//  Created by Sashen Pillay on 2022/01/12.
//

import UIKit

class CreditScoreDoughnut: UIView {
    
    // MARK: Attribute(s)
    
    private let shapeLayer = CAShapeLayer()
    private let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
    var delegate: DoughnutViewDelegate?
    
    // MARK: IBOutlet(s)
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var creditScoreLabel: UILabel!
    
    // MARK: Constructor(s)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialiseView()
        self.initialiseTapGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialiseView()
        self.initialiseTapGesture()
    }
    
    // MARK: Method(s)
    
    private func initialiseView() {
        Bundle.main.loadNibNamed("CreditScoreDoughnut",
                                 owner: self,
                                 options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    private func initialiseTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        self.addGestureRecognizer(gesture)
    }
    
    private func initialiseTrack() {
        let center = contentView.center
        let trackLayer = CAShapeLayer()
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 15
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        contentView.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.cyan.cgColor
        shapeLayer.lineWidth = 30
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = 0
        contentView.layer.addSublayer(shapeLayer)
        
    }
    
    func animate(_ score: Int, _ max: Int) {
        AsynchronousProvider.runOnMain({
            let percentage = Double(score)/Double(max)
            self.basicAnimation.toValue = percentage
            self.basicAnimation.duration = 1
            self.basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            self.basicAnimation.isRemovedOnCompletion = false
            self.shapeLayer.add(self.basicAnimation, forKey: "shapeLayerAnimation")
        })
    }
    
    func setValues(_ score: Int, _ max: Int) {
        self.initialiseTrack()
        self.creditScoreLabel.text = "\(score) / \(max)"
        self.animate(score, max)
    }
    
    @objc func viewTapped() {
        self.delegate?.doughnutTapped()
    }
    
}
