//
//  UserProfileAvailabilityImplemetation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/31/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile Availability Implemetation
class UserProfileAvailabilityImplemetation: UserProfileAvailabilityRepresentables {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String
    
    /// User Availability
    var userAvailability: [String: Bool]
    
    /**
     Initializer
     */
    init(userAvailability: [String: Bool]) {
        
        self.userAvailability = userAvailability
        self.cellHeight = SkillsCell.getCellHeight()
        self.cellReuseIdentifier = SkillsCell.getReusableIdentifier()
    }
    
    /// Availability Text
    var availabilityText: [String] {
        
        var availabilities: [String] = [String]()
        
        for eachAvailableTime in userAvailability {
            
            if eachAvailableTime.value == true {
             availabilities.append(eachAvailableTime.key)
            }
            
        }
        return availabilities
    }
    
}
