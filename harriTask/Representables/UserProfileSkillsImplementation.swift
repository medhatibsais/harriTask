//
//  UserProfileSkillsImplementation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/31/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile Skills Implementation
class UserProfileSkillsImplementation: UserProfileSkillsRepresentables {
    
    /// Cell Height
    var cellHeight: CGFloat
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String
    
    /// User Skill
    var userSkill: UserSkill
    
    /**
     Initializer
     */
    init(userSkill: UserSkill) {
        self.userSkill = userSkill
        self.cellHeight = SkillsCell.getCellHeight()
        self.cellReuseIdentifier = SkillsCell.getReusableIdentifier()
    }
    
    /// Skill Text
    var skillText: String {
        return userSkill.name
    }
}
