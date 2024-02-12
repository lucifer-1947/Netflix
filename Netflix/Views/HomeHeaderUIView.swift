//
//  HomeTableViewHeaderFooterView.swift
//  Netflix
//
//  Created by Raj Guggilla on 08/02/24.
//

import UIKit

class HomeHeaderUIView: UIView {
    
    let playButton : UIButton = {
       
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
    }()
    
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
    
    private func applyConstraints(){
        
        let playButtonConstriants = [playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),playButton.widthAnchor.constraint(equalToConstant: 100)]
        
        NSLayoutConstraint.activate(playButtonConstriants)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(heroImageView)
        addGradient()
        
        addSubview(playButton)
        applyConstraints()
       
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
