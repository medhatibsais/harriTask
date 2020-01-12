//
//  UserProfileContent.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile Content
struct UserProfileContent: Decodable {
    
    /// Availability
    var availability: [String: Bool]
    
    /// Background Image Link
    var background_image: String?
    
    /// Current Job
    var current_job: String?
    
    /// Education
    var education: [UserProfileEducation]
    
    /// Experience
    var experience: [UserProfileExperience]
    
    /// profile image link
    var profile_image: String?
    
    /// user info
    var user_info: UserProfileInfo
    
    /// user location
    var user_location: [UserProfileLocation]
    
//    /// user media
//    var user_media:
    
    /// user profile
    var user_profile: UserProfileBio
    
    /// user skill
    var user_skill: [UserSkill]
    
    /// video domain
    var video_domain: String
    
}
