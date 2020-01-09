//
//  UserdataFetchBody.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/12/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import Foundation

struct UserSearchBodyData: Encodable {
    let size: Int
    let start: Int
    let locations: [String]
}

class UserSearchDataResponse: Decodable {
    let data: userSearchWholeResultData
}

class userSearchWholeResultData: Decodable {
    let results: [User]
    let hits: Int
}

/// User Data Fetch Body for class/protocl,struct/enum
class User: Decodable { // User
    
    /// First name /// for class/protocl,struct
    let firstName: String
    
    /// Last name
    let lastName: String
    
    /// ID
    let id: Int
    
    /// Is first job
    let isFirstJob: Bool
    
    /// Profile image uuid
    let profileImageUUID: String?
    
    /// Position
    let position: Position?
    
    /// Positions
    let positions: [Position]?
}

class Position: Decodable, Equatable { // Separate file
    
    let brandName: String
    let name: String
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.brandName == rhs.brandName && lhs.name == rhs.name
    }
}
