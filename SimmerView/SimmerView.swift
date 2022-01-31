//
//  SimmerView.swift
//  SimmerView
//
//  Created by Arun Rathore on 31/01/22.
//


import UIKit

class ShimmerView: UIView {
    
    var gradientColorOne : CGColor = UIColor(white: 0.85, alpha: 1.0).cgColor
    var gradientColorTwo : CGColor = UIColor(white: 0.95, alpha: 1.0).cgColor
    
    private let animationKeyPath = "locations"
    private let layerIdentifier = "shimmerLayerIdentifier"
    
    lazy var gradientLayer: CAGradientLayer = {
        guard let layer = self.layer.sublayers?.first(where: { $0.name == layerIdentifier }) as? CAGradientLayer else {
            let gradientLayer = CAGradientLayer()
            gradientLayer.name = layerIdentifier
            gradientLayer.frame = self.bounds
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.colors = [gradientColorOne, gradientColorTwo, gradientColorOne]
            gradientLayer.locations = [0.0, 0.5, 1.0]
            self.layer.addSublayer(gradientLayer)
            return gradientLayer
        }
        return layer
    }()
    
    private var basicAnimation: CABasicAnimation {
        let animation = CABasicAnimation()
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.repeatCount = .infinity
        animation.duration = 0.9
        return animation
    }
    
    func animate() {
        if self.gradientLayer.animation(forKey: self.animationKeyPath) == nil {
            self.gradientLayer.add(self.basicAnimation, forKey: self.animationKeyPath)
        }
    }
}

