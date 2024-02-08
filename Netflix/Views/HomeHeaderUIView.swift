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
        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
