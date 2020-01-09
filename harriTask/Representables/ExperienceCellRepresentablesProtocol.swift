//
//  ExperienceCellRepresentablesProtocol.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Experience Cell Representables Protocol
protocol ExperienceCellRepresentablesProtocol: UserProfileRepresentables {
    
    /// Job Text
    var JobText: NSMutableAttributedString { get }
    
    /// Brand Name Text
    var brandNameText: NSMutableAttributedString { get }
    
    /// Description Text
    var descriptionText: NSMutableAttributedString { get }
    
    /// Date Text
    var dateText: NSMutableAttributedString { get }
    
    
}
