//
//  NavigationControllerExtension.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/19/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// UINavigationController
extension UINavigationController {
    
    /// Change The Status Bar Style To Light Content For The Navigation
   open override var preferredStatusBarStyle: UIStatusBarStyle {
      return topViewController?.preferredStatusBarStyle ?? .lightContent
   }
}
