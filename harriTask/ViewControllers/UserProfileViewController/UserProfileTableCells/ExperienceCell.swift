//
//  ExperienceCell.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Experience Cell
class ExperienceCell: UITableViewCell {

    /// Info View
    @IBOutlet weak var infoView: UIView!
    
    /// Cell Content View
    @IBOutlet weak var cellContentView: UIView!
    
    /// Current Job Label
    @IBOutlet weak var currentJobLabel: UILabel!
    
    /// Brand Label
    @IBOutlet weak var brandLabel: UILabel!
    
    /// Description Text
    @IBOutlet weak var descriptionText: UILabel!
    
    /// Date Label
    @IBOutlet weak var dateLabel: UILabel!
    
    /// Is First Cell
    var isFirstCell: Bool = false
    
    /// Is Last Cell
    var isLastCell: Bool = false
    
    /**
     Setup Views With
     */
    func setupViewsWith(experienceRepresentables: ExperienceCellRepresentablesProtocol) {
        
        currentJobLabel.attributedText = experienceRepresentables.JobText
        brandLabel.attributedText = experienceRepresentables.brandNameText
        descriptionText.attributedText = experienceRepresentables.descriptionText
        dateLabel.attributedText = experienceRepresentables.dateText
    }
    
    /**
     Prepare For Reuse
     */
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isFirstCell = false
        isLastCell = false
    }
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        if isFirstCell {
//            self.infoView.roundCorners(corners: [.topLeft,.topRight], radius: 5)
//        }
//        if isLastCell {
//            self.infoView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 5)
//        }
//    }
    
    /**
     Draw
     */
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        if isFirstCell {
            self.infoView.roundCorners(corners: [.topLeft,.topRight], radius: 5)
            
//            self.infoView.layer.cornerRadius = 50
//            self.infoView.clipsToBounds = true
//            self.infoView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
            
        }
        if isLastCell {
            self.infoView.roundCorners(corners: [.bottomLeft,.bottomRight], radius: 5)
//            self.infoView.layer.cornerRadius = 5
//            self.infoView.clipsToBounds = true
//            self.infoView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        }
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
        return "experienceCell"
    }

}
