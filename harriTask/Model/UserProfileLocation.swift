//
//  UserProfileLocation.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User City And Country
struct UserCityAndCountry: Decodable {
    
    /// Code
    var code: String
    
    /// id
    var id: Int
    
    /// name
    var name: String
    
}

/// User Profile Location
struct UserProfileLocation: Decodable {
    
    /// City
    var City: UserCityAndCountry?
    
    /// Country
    var Country: UserCityAndCountry
    
    /// city id
    var city_id: Int?
    
    /// country id
    var country_id: Int
    
    /// formatted address
    var formatted_address: String
    
    /// id
    var id: Int
    
    /// is primary
    var is_primary: Bool
    
    /// latitude
    var latitude: Double
    
    /// longitude
    var longitude: Double
    
    /// miles
    var miles: Int?
}
