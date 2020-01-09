//
//  AboutCellRepresentables.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/26/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// About Cell Representables
protocol AboutCellRepresentables: UserProfileRepresentables {
    
    /// About User Text
    var aboutUserText: NSMutableAttributedString { get }
}
