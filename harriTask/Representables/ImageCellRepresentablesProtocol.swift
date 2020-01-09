//
//  ImageCellRepresentables.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Image Cell Representables Protocol
protocol ImageCellRepresentablesProtocol: UserProfileRepresentables {
    
    /// Profile Image
    var profileImage: String { get }
    
    /// Background Image
    var backgroundImage: String { get }
    
    /// User Name
    var userName: NSMutableAttributedString { get }
    
    /// Job Position
    var jobPosition: NSMutableAttributedString { get }
}
