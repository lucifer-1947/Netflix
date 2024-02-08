//
//  CollectionViewTableViewCell.swift
//  Netflix
//
//  Created by Raj Guggilla on 08/02/24.
//

import UIKit

//if you want you can assign this to a storyboard to configure and create outlets and actions from there .
class CollectionViewTableViewCell: UITableViewCell {

    static let customReuseIdentifier = "CollectionViewTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Intialisetion code heres instead of awake from nib.
        
        contentView.backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    
////this is only trigged when the viewcontrollers loads the view intially , but we are adding cells later , this won't be trigged. So instead we use init method to start anything on cell
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//
//        contentView.backgroundColor = .systemPink
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
