//
//  UserdataFetchBody.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/12/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//
import Foundation


/// User Data Fetch Body
struct User: Decodable { // User
    
    /// First name
    var firstName: String
    
    /// Last name
    var lastName: String
    
    /// ID
    var id: Int
    
    /// Is first job
    var isFirstJob: Bool
    
    /// Profile image uuid
    var profileImageUUID: String?
    
    /// Position
    var currentPosition: Position?
    
    /// Positions
    var positions: [Position]
    
    /// Location
    var location: Location
    
    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        
        case firstName
        case lastName
        case id
        case isFirstJob
        case profileImageUUID
        case positions
        case location
        case currentPosition = "position"
    }
}
