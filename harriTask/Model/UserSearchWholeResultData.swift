//
//  UserSearchWholeResultData.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/18/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import Foundation

/// User Search Whole Result Data
struct UserSearchWholeResultData: Decodable {
    
    /// Results
    var results: [User]
    
    /// Hits
    var hits: Int
}
