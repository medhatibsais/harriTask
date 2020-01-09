//
//  Availability.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Availability
struct Availability: Decodable {
    
    /// anytime, friday_afternoon, friday_evening, friday_morning, full_time, monday_afternoon, monday_evening,
    /// monday_morning, part_time, saturday_afternoon, saturday_evening, saturday_morning, sunday_afternoon, sunday_evening,
    /// sunday_morning, thursday_afternoon, thursday_evening, thursday_morning, tuesday_afternoon, tuesday_evening, tuesday_morning,wednesday_afternoon, wednesday_evening, wednesday_morning, weekdays, weekend_days, weekend_nights, weeknights
    
    var anytime, friday_afternoon, friday_evening, friday_morning, full_time, monday_afternoon, monday_evening,
    monday_morning, part_time, saturday_afternoon, saturday_evening, saturday_morning, sunday_afternoon, sunday_evening,
    sunday_morning, thursday_afternoon, thursday_evening, thursday_morning, tuesday_afternoon, tuesday_evening, tuesday_morning,
    wednesday_afternoon, wednesday_evening, wednesday_morning, weekdays, weekend_days, weekend_nights, weeknights: Bool?
    
}
