//
//  UsersTableFooterView.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/17/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Users Table Footer View
class UsersTableFooterView: UIView {

    /// Whole Footer View
    @IBOutlet var wholeFooterView: UIView!
    
    @IBOutlet weak var testLabel: UILabel!
    /**
     Initializer
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setting up  the view
        setupView()
    }
    
    /**
     Initializer
     */
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        // setting up  the view
        setupView()
    }
    
    /**
     Setup View
     */
    func setupView(){
        Bundle.main.loadNibNamed("LoadingFooterView", owner: self, options: nil)
        addSubview(wholeFooterView)
        wholeFooterView.frame = self.bounds
        wholeFooterView.backgroundColor = .clear
    }

}
