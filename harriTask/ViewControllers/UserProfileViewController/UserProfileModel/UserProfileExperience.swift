//
//  UserProfileExperience.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Work Brand
struct UserWorkBrand: Decodable {
    
    /// created
    var created: String
    
    /// description
    var description: String?
    
    /// group id
    var group_id: Int
    
    /// hide images
    var hide_images: Bool
    
    /// id
    var id: Int
    
    /// name
    var name: String
    
    /// type
    var type: String
    
    /// updated
    var updated: String
    
    /// url
    var url: String?
    
}

/// User Work
struct UserWork: Decodable {
    
    /// Brand
    var Brand: UserWorkBrand
    
    /// brand id
    var brand_id: Int
    
    /// custom position
    var custom_position: String?
    
    /// description
    var description: String?
    
    /// end date
    var end_date: String?
    
    /// ID
    var id: Int
    
    /// start date
    var start_date: String
}

/// User Profile Experience
struct UserProfileExperience: Decodable {
    
    var Work: UserWork
    
}
