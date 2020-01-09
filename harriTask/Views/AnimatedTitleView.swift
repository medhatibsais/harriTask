//
//  ConcealingTitleView.swift
//  harriTask
//
//  Created by Medhat Ibsais on 1/5/20.
//  Copyright © 2020 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Animated Title View
final class AnimatedTitleView: UIView {
    
    /// Label
    private let label = UILabel()
    
    /// Content Offset
    private var contentOffset: CGFloat = 0 {
        didSet {
            label.frame.origin.y = titleVerticalPositionAdjusted(by: contentOffset)
        }
    }
    
    /// Text
    var text: String = "" {
        didSet {
            label.text = text
            label.textColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
            label.font = UIFont(name: "OpenSans", size: 14)
            setNeedsLayout()
        }
    }
    
    /**
     Initializers
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        clipsToBounds = true
    }
    
    /**
     Initializers
     */
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     Size That Fits
     */
    override func sizeThatFits(_ size: CGSize) -> CGSize {
            return super.sizeThatFits(size)
    }
    
    /**
     Layout Subviews
     */
    override func layoutSubviews() {
        super.layoutSubviews()
            let size = label.sizeThatFits(bounds.size)
            let x: CGFloat
            let y: CGFloat
            
            x = bounds.midX - size.width * 0.5
            y = titleVerticalPositionAdjusted(by: contentOffset)
            label.frame = CGRect(x: x, y: y, width: size.width, height: size.height)
    }
    
    /**
     Scroll View Did Scroll
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView, paddingFromY: CGFloat) {
        contentOffset = scrollView.contentOffset.y - paddingFromY
    }
    
    /**
     Title Vertical Position Adjusted
     */
    private func titleVerticalPositionAdjusted(by yOffset: CGFloat) -> CGFloat {
        
        let midY = bounds.midY - label.bounds.height * 0.5
        return max(bounds.maxY - yOffset, midY).rounded()
    }
}
