//
//  UserProfileEducation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Institution
struct EducationInstitution: Decodable {
    
    /// ID
    var id: Int
    
    /// Name
    var name: String
}

/// Education Degree Lookup
struct EducationDegreeLookup: Decodable {
    
    /// Degree
    var degree: String
    
    /// ID
    var id: Int
    
}

/// User Education Info
struct UserEducationInfo: Decodable {
    
    /// ID
    var id: Int
    
    /// DegreeLookup
    var DegreeLookup: EducationDegreeLookup
    
    /// Institution
    var Institution: EducationInstitution
}


/// User Profile Education
struct UserProfileEducation: Decodable {

    /// User Education
    var UserEducation: UserEducationInfo
}
