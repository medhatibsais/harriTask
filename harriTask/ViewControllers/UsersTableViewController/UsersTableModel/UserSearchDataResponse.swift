//
//  UserSearchDataResponse.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/18/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import Foundation

/// User Search Data Response
struct UserSearchDataResponse: Decodable {
    
    /// Data
    var data: UserSearchWholeResultData
}
