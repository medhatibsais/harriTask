//
//  UserCell.swift
//  harriTask
//
//  Created by Medhat Ibsais on 10/14/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

/// User Cell
class UserCell: UITableViewCell {
    
    /// User Image View
    @IBOutlet weak var userImageView: JNAvatarWithInitials!
    
    /// User Name Label
    @IBOutlet weak var userNameLabel: UILabel!
    
    /// User Job Label
    @IBOutlet weak var userJobLabel: UILabel!
    
    /**
     Setup Image
     */
    func setupImage() {
        userImageView.layer.masksToBounds = true
        userImageView.layer.backgroundColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1).cgColor
        userImageView.layer.cornerRadius = 25
    }
    
    /**
     Awake From Nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // setup the image view settings
        setupImage()
    }
    
    /**
     Setup Cell Views
     */
    func setupCellViews(cellRepresentable: TableViewCellRepresentable){
        
        userNameLabel.text = cellRepresentable.userNameText
        userJobLabel.attributedText = cellRepresentable.userJobText
        userImageView.setup(imageUrl: cellRepresentable.userImageLink, placeHolderImage: UIImage(named: "venice"), fullName: cellRepresentable.userNameText, showInitails: true)
    }
    
    /**
     Get Cell Height
     */
    static func getCellHeight() -> CGFloat{
        return 100
    }
    
    /**
     Get Reusable Identifier
     */
    static func getReusableIdentifier() -> String{
        return "userCell"
    }

}
