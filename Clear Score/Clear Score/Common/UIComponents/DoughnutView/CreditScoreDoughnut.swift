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
    private let nibName = "CreditScoreDoughnut"
    private let radius: CGFloat = 100
    private let startAngle = -CGFloat.pi / 2
    private let endAngle = 2 * CGFloat.pi
    private let trackLayerLineWidth: CGFloat = 15
    private let shapeLayerLineWidth: CGFloat = 30
    private let strokeEnd: CGFloat = 0
    private let animationDuration: CGFloat = 1
    private let animationKey = "shapeLayerAnimation"
    
    // MARK: Delegate
    
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
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
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
        
        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: radius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = trackLayerLineWidth
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        contentView.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.cyan.cgColor
        shapeLayer.lineWidth = shapeLayerLineWidth
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeEnd = strokeEnd
        contentView.layer.addSublayer(shapeLayer)
        
    }
    
    func animate(_ score: Int, _ max: Int) {
        AsynchronousProvider.runOnMain({
            let percentage = Double(score)/Double(max)
            self.basicAnimation.toValue = percentage
            self.basicAnimation.duration = self.animationDuration
            self.basicAnimation.fillMode = CAMediaTimingFillMode.forwards
            self.basicAnimation.isRemovedOnCompletion = false
            self.shapeLayer.add(self.basicAnimation, forKey: self.animationKey)
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
