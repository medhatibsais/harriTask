//
//  ProfileImageCell.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

/// Profile Image Cell
class ProfileImageCell: UITableViewCell {

    /// Background Image
    @IBOutlet weak var backgroundImage: JNAvatarWithInitials!
    
    /// Profile Image
    @IBOutlet weak var profileImage: JNAvatarWithInitials!
    
    /// Name Label
    @IBOutlet weak var nameLabel: UILabel!
    
    /// Current Job Label
    @IBOutlet weak var currentJobLabel: UILabel!
    
    /// Message Image
    @IBOutlet weak var messageImage: UIView!
    
    /// Share Image
    @IBOutlet weak var shareImage: UIView!
    
    
    /**
     Awake From Nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupImages()
    }
    
    /**
     Setup Images
     */
    func setupImages() {
        
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 32
        profileImage.layer.borderWidth = 2
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        messageImage.layer.masksToBounds = true
        messageImage.layer.cornerRadius = 23
        messageImage.backgroundColor = .white
        
        shareImage.layer.masksToBounds = true
        shareImage.layer.cornerRadius = 23
        shareImage.backgroundColor = .white
    }
    
    /**
     Setup Cell Views
     */
    func setupCellViews(imageCellRepresentable: ImageCellRepresentablesProtocol){

        
        backgroundImage.setup(imageUrl: imageCellRepresentable.backgroundImage, placeHolderImage: UIImage(named: "venice"), fullName: "", showInitails: false)
        
        nameLabel.attributedText = imageCellRepresentable.userName
        currentJobLabel.attributedText = imageCellRepresentable.jobPosition
        profileImage.setup(imageUrl: imageCellRepresentable.profileImage, placeHolderImage: UIImage(named: "venice"), fullName: "", showInitails: false)

        profileImage.layer.zPosition = 2000
        nameLabel.layer.zPosition = 2000
        currentJobLabel.layer.zPosition = 2000
        shareImage.layer.zPosition = 2000
        messageImage.layer.zPosition = 2000
        
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
        return "imageProfileCell"
    }

}
