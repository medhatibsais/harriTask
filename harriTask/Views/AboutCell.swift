//
//  AboutCell.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// About Cell
class AboutCell: UITableViewCell {
    
    /// About User Text View
    @IBOutlet weak var aboutUserTextView: UITextView!

    /// User Profile Delegate
    var userProfileDelegate: UserProfileViewControllerDelegate?
    
    /// About User Text
    var aboutUserText: NSAttributedString! = nil
    
    /// Is Pressed
    var isShowMorePressed = false
    
    /// Truncated About User
    var truncatedAboutUser: NSMutableAttributedString?
    
    /**
     Awake From Nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupViews()
    }
    
    /**
     Setup Views
     */
    func setupViews(){
                
        aboutUserTextView.isEditable = false
        aboutUserTextView.isUserInteractionEnabled = true
        aboutUserTextView.delegate = self
        aboutUserTextView.isScrollEnabled = false
    }
    
    /**
     Handle Show Less
     */
    func handleShowLess(){

        isShowMorePressed = false
        
        aboutUserTextView.attributedText = truncatedAboutUser
        
        userProfileDelegate?.updateProfileTableView()
    }
    
    /**
     Handle Show More
     */
    func handleShowMore(){
        
        isShowMorePressed = true
        
        let aboutUserString = aboutUserText.string
            
        let aboutUserAttributedString = NSMutableAttributedString()
            
        aboutUserAttributedString.append(NSAttributedString(string: aboutUserString, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
        
        aboutUserAttributedString.append(NSAttributedString(string: " Show Less", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!,NSMutableAttributedString.Key.foregroundColor: UIColor.blue]))
            
                aboutUserAttributedString.addAttribute(.link, value: "google.com", range: NSRange(location: aboutUserAttributedString.length - 10, length: 10))
            
        aboutUserTextView.attributedText = aboutUserAttributedString
        
        userProfileDelegate?.updateProfileTableView()
    }
    
    /**
     Set Views Data
     */
    func setViewsData(aboutCellRepresentable: AboutCellRepresentables){
        
        aboutUserText = aboutCellRepresentable.aboutUserText
        
        if isShowMorePressed {
            handleShowMore()
            return
        }
        
            if aboutCellRepresentable.aboutUserText.string.count > 100 {
                
                let aboutUserAttributedString = NSMutableAttributedString()
                let prefixedString = aboutCellRepresentable.aboutUserText.string.prefix(100)
                aboutUserAttributedString.append(NSAttributedString(string: String(prefixedString) + "...", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!,NSMutableAttributedString.Key.foregroundColor: UIColor.black]))
                aboutUserAttributedString.append(NSAttributedString(string: "Show More", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!,NSMutableAttributedString.Key.foregroundColor: UIColor.blue]))
                
                aboutUserAttributedString.addAttribute(.link, value: "google.com", range: NSRange(location: aboutUserAttributedString.length - 10, length: 10))
                
                truncatedAboutUser = aboutUserAttributedString
                aboutUserTextView.attributedText = aboutUserAttributedString
            }
            
            else {
                aboutUserTextView.attributedText = aboutUserText
            }
    }
    
    /**
     Get Cell Height
     */
    static func getCellHeight() -> CGFloat {
        return 100
    }
    
    /**
     Get Reusable Identifier
     */
    static func getReusableIdentifier() -> String {
        return "aboutCell"
    }


}
