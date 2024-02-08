//
//  HomeTableViewHeaderFooterView.swift
//  Netflix
//
//  Created by Raj Guggilla on 08/02/24.
//

import UIKit

class HomeHeaderUIView: UIView {
    
    //writing properties like this makes everything related to that property at one place.
    let heroImageView  : UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "asset1")
        return imageView
        
    }()
    
    
    private func addGradient() {
        
    
        //creating gradient.
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        
        gradientLayer.frame = bounds // setting layers frame to bonds of its parent view , so that gradient will aplly full.
        
        layer.addSublayer(gradientLayer) //as i said any view or layer added through add is placed on top on existing view or layer.
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
