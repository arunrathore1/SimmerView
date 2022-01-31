//
//  UIViewExtension.swift
//  SimmerView
//
//  Created by Arun Rathore on 31/01/22.
//

import UIKit

extension UIView {
    
    private var getShimmerView : ShimmerView? {
        if !(self is UIVisualEffectView) {
            return self.shimmerView
        }
        return nil
    }
    
    
    private var shimmerView: ShimmerView {
        guard let shimmerView = self.subviews.first(where: { $0.tag == 100 }) as? ShimmerView else {
            let shimmerView = ShimmerView(frame: self.frame)
            shimmerView.translatesAutoresizingMaskIntoConstraints = false
            shimmerView.tag = 100
            self.addSubview(shimmerView)
            let constraints = [
                self.leadingAnchor.constraint(equalTo: shimmerView.leadingAnchor),
                self.trailingAnchor.constraint(equalTo: shimmerView.trailingAnchor),
                self.topAnchor.constraint(equalTo: shimmerView.topAnchor),
                self.bottomAnchor.constraint(equalTo: shimmerView.bottomAnchor),
            ]
            NSLayoutConstraint.activate(constraints)
            return shimmerView
        }
        return shimmerView
    }
    
    func showShimmer() {
        if let view = self.getShimmerView {
            view.isHidden = false
            view.animate()
            view.gradientLayer.cornerRadius = self.layer.cornerRadius
            self.bringSubviewToFront(view)
            
        }
    }
    
    func hideShimmer() {
        self.getShimmerView?.removeFromSuperview()
    }
}
