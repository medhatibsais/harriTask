//
//  Location.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/18/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Location
struct Location: Decodable {
    
    /// City
    var city: String?
    /// State
    var state: String?
    /// Latitude
    var latitude: CGFloat
    /// Longitude
    var longitude: CGFloat
}
