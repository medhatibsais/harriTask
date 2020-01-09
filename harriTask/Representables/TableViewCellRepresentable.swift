//
//  TableViewCellRepresentable.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/16/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Table View Cell Representable
protocol TableViewCellRepresentable {
    
    /// Cell Height
    var cellHeight: CGFloat { get set }
    
    /// Cell Reuse Identifier
    var cellReuseIdentifier: String { get set }
    
    /// User Name Text
    var userNameText: String { get }
    
    /// User Image Link
    var userImageLink: String { get }
    
    /// User Job Text
    var userJobText: NSMutableAttributedString { get }
}
