//
//  UserProfileTableDelegate.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile View Controller
extension UserProfileViewController: UITableViewDelegate {
    
    /**
     Height For Header In Section
     */
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 40
    }
    
    /**
     View For Header In Section
     */
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return userInfoViewModel?.headerTableView(sectionNumber: section)
    }
    
    /**
     Height For Row At
     */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    /**
     Estimated Height For Row At
     */
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    /**
     Did Select Row At
     */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    /**
     Scroll View Did Scroll
     */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        self.navigationController?.navigationBar.alpha = 1
        statusBarView.alpha = 1
            
        guard let titleView = navigationItem.titleView as? AnimatedTitleView else { return }
        titleView.scrollViewDidScroll(scrollView,paddingFromY: 104 - (self.view.safeAreaInsets.top - 64))
        
            var offset = scrollView.contentOffset.y / 100
        
            let color = UIColor(red: 1 , green: 1 , blue: 1, alpha: offset)
            
            if offset <= 0 {
                self.navigationController?.navigationBar.backgroundColor = UIColor.white.withAlphaComponent(0)
                self.navigationController?.navigationBar.tintColor = .white
                statusBarView.alpha = 0
            }
            
            else if offset > 1 {
                
                offset = 1
                self.navigationController?.navigationBar.backgroundColor = color
                
                self.navigationController?.navigationBar.tintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: offset)
                
                statusBarView.backgroundColor = color
            }
            else {
                
                self.navigationController?.navigationBar.backgroundColor = color
                
                self.navigationController?.navigationBar.tintColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: offset)
                
                statusBarView.backgroundColor = color
            }
        }
    
    
}
