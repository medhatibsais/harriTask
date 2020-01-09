//
//  MainCellRepresentables.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/16/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit
import JNAvatarWithInitials

/// Main Cell Representables
class MainCellRepresentables: TableViewCellRepresentable {

    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell ReuseIdentifier
    var cellReuseIdentifier: String
    
    /// User
    var user: User
    
    /**
     Initializer
     */
    init(user: User) {
        
        cellHeight = UITableView.automaticDimension
        cellReuseIdentifier = UserCell.getReusableIdentifier()
        self.user = user
    }
    
    /// User Name Text
    var userNameText: String {
        return "\(user.firstName) \(user.lastName)"
    }
    
    /// User Image Link
    var userImageLink: String {
        
        if user.profileImageUUID != nil {
            
            let imageLink = StaticValues.userImageURL + String(user.id) + StaticValues.publicImageDirectory + user.profileImageUUID! + StaticValues.imageSize
            return imageLink
        }
        return ""
    }
    
    /// User Job Text
    var userJobText: NSMutableAttributedString {
        if user.currentPosition != nil {
                
            let attributedString = NSMutableAttributedString(string: user.currentPosition!.name + ", ", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black])
            attributedString.append(NSMutableAttributedString(string: user.currentPosition!.brandName, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
            
            return attributedString
        }
        else if user.positions.count == 0 || user.isFirstJob {
            
            var firstJobAttributedString = NSMutableAttributedString()
            firstJobAttributedString = NSMutableAttributedString(string: "Is looking for their first job",attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Italic", size: 12)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black])
            
            return firstJobAttributedString
        }
        else {
            let positionsText = NSMutableAttributedString(string: "",attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black])
            for eachPosition in user.positions {
                
                if eachPosition == user.positions.last {
                    
                    positionsText.append(NSMutableAttributedString(string: user.currentPosition!.name + ", ",attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
                    
                    positionsText.append(NSMutableAttributedString(string: user.currentPosition!.brandName,attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
                }
                
                positionsText.append(NSMutableAttributedString(string: user.currentPosition!.name + ", ",attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
                
                positionsText.append(NSMutableAttributedString(string: user.currentPosition!.brandName + ", ",attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 14)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
            }
            
            return positionsText
        }
    }

}
