//
//  SkillsCell.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Skills Cell
class SkillsCell: UITableViewCell {
    
    /// Skills Collection View
    @IBOutlet weak var skillsCollectionView: DynamicHeightCollectionView!
    
    /// Profile Table Section
    var profileTableSection: Int = 0
    
    /// User Profile View Model
    var userProfileViewModel: UserInfoViewModel?
    
    /**
     Awake From Nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupViews()
        
        skillsCollectionView.delegate = self
        skillsCollectionView.dataSource = self
    }
    
    /**
     Setup Views
     */
    func setupViews(){
        
        skillsCollectionView.layer.masksToBounds = true
        skillsCollectionView.layer.cornerRadius = 5
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
        return "skillCell"
    }
    
}
