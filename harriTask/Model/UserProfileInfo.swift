//
//  UserProfileInfo.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile Info
struct UserProfileInfo: Decodable {
    
    /// about
    var about: String?
    
    /// created
    var created: String?
    
    /// current login at
    var current_login_at: String?
    
    /// feature
    var feature: Bool?
    
    /// first name
    var first_name: String?
    
    /// id
    var id: Int?
    
    /// is public
    var is_public: Bool?
    
    /// last login at
    var last_login_at: String?
    
    /// last name
    var last_name: String?
    
    /// login count
    var login_count: Int?
    
    /// phone
    var phone: String?
    
    /// slug
    var slug: String?
    
    /// team user id
    var team_user_id: Int?
    
    /// updated
    var updated: String?
    
    /// user candidate
    var user_candidate: Bool?
    
    /// user employer
    var user_employer: Bool?
    
    /// user network
    var user_network: Bool?
    
    /// User Name
    var username: String?
    
}
