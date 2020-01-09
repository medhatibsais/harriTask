//
//  Positions.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/17/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Position
struct Position: Decodable, Equatable { // Separate file

    /// Brand Name
    var brandName: String
    
    /// Name
    var name: String
    
    /// Start Date
    var startDate: String
    
    /// End Date
    var endDate: String?
    

    /**
     ==
     */
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.brandName == rhs.brandName && lhs.name == rhs.name
        }
}
