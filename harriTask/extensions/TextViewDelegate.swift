//
//  TextViewDelegate.swift
//  harriTask
//
//  Created by Medhat Ibsais on 1/5/20.
//  Copyright © 2020 Medhat Ibsais. All rights reserved.
//

import UIKit

 /// AboutCell
 extension AboutCell: UITextViewDelegate {
     
     /**
      Text View Should Interact With URL
      */
     func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
         
         if !isShowMorePressed {
             handleShowMore()
         }
         else {
             handleShowLess()
         }
         return false
     }
 }
