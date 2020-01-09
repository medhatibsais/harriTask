//
//  CheckListView.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Check List View
class CheckListView: UIView {

    
    /// Whole Check List View
    @IBOutlet var WholeCheckListView: UIView!
    
    /// Skill Label
    @IBOutlet weak var skillLabel: UILabel!
    
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
        Bundle.main.loadNibNamed("checkListView", owner: self, options: nil)
        addSubview(WholeCheckListView)
        WholeCheckListView.frame = self.bounds
        WholeCheckListView.backgroundColor = .clear
        
        WholeCheckListView.layer.borderWidth = 1
        WholeCheckListView.layer.borderColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1).cgColor
        WholeCheckListView.layer.cornerRadius = 5
    }

}
