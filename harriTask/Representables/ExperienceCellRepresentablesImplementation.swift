//
//  ExperienceCellRepresentablesImplementation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Experience Cell Representables Implementation
class ExperienceCellRepresentablesImplementation: ExperienceCellRepresentablesProtocol {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String
    
    /// User Experience
    var userExperience: UserProfileExperience
    
    
    /**
     Initializer
     */
    init(userExperience: UserProfileExperience) {
        
        cellHeight = ExperienceCell.getCellHeight()
        cellReuseIdentifier = ExperienceCell.getReusableIdentifier()
        self.userExperience = userExperience
    }
    
    /// Job Text
    var JobText: NSMutableAttributedString {
        
        if let jobTitle = userExperience.Work.custom_position {
        return NSMutableAttributedString(string: jobTitle, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 15)!])
        }
        
        return NSMutableAttributedString(string: "Unknown", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 15)!])
    }
    
    /// Brand Name Text
    var brandNameText: NSMutableAttributedString {
        
        return NSMutableAttributedString(string: userExperience.Work.Brand.name, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans-Semibold", size: 13)!])
    }
    
    /// Description Text
    var descriptionText: NSMutableAttributedString {
        
        if let jobDescription = userExperience.Work.description {
        return NSMutableAttributedString(string: jobDescription, attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!])
        }
        
        return NSMutableAttributedString(string: "No Description", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 13)!])
    }
    
    /// Date Text
    var dateText: NSMutableAttributedString {
        
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateFormat = "E, d MMM yyyy HH:mm:ss Z"

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MMM yyyy"
        
        let startDateFormatted = dateFormatter2.string(from: dateFormatter1.date(from: userExperience.Work.start_date)!)
        
        var endDateFormatted = "Currenlty"
        
        if let endDateValue = userExperience.Work.end_date {

            endDateFormatted = dateFormatter2.string(from: dateFormatter1.date(from: endDateValue)!)
        }
        
        
    return NSMutableAttributedString(string: "\(startDateFormatted)-\(endDateFormatted)", attributes: [NSMutableAttributedString.Key.font: UIFont(name: "OpenSans", size: 12)!])
    }
    
}
