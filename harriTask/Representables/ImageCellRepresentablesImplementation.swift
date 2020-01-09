//
//  ImageCellRepresentablesImplementation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Image Cell Representables Implementation
class ImageCellRepresentablesImplementation: ImageCellRepresentablesProtocol {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String

    /// User Profile
    var userProfile: UserProfileContent
    
    /// User
    var user: User
    
    /// User Name Text
    var userNameText: NSMutableAttributedString?
    
    /**
     Initializer
     */
    init(userProfile: UserProfileContent, user: User) {
    
        cellHeight = ProfileImageCell.getCellHeight()
        cellReuseIdentifier = ProfileImageCell.getReusableIdentifier()
        
        self.userProfile = userProfile
        self.user = user
        
    }

    /// Profile mage
    var profileImage: String {
        
        if userProfile.profile_image != nil {
            
            let imageLink = StaticValues.userImageURL + String(self.user.id) + StaticValues.publicImageDirectory + userProfile.profile_image! + StaticValues.imageSize
            return imageLink
        }
        return ""
    }
    
    /// User Name
    var userName: NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: "\(user.firstName) \(user.lastName)", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 20)!, NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        
        return attributedString
    }
    
    /// Job Position
    var jobPosition: NSMutableAttributedString {
        
        if userProfile.current_job != nil {
                let attributedString = NSMutableAttributedString(string: userProfile.current_job!, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        
        return attributedString
        }
        
        return NSMutableAttributedString(string: "No Job", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.white])
    }
    
    /// Background Image
    var backgroundImage: String {
        if userProfile.background_image != nil {
            
            let imageLink = StaticValues.userImageURL + String(self.user.id) + StaticValues.backgroundImageDirectory + userProfile.background_image! + StaticValues.imageSize
            return imageLink
        }
        return ""
    }
    
}
