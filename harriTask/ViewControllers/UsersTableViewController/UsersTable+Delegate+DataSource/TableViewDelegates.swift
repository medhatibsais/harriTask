//
//  Extensions+TableViewDelegates.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/3/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Users Table View Controller
extension UsersTableViewController: UITableViewDelegate {
    
    /**
     Will Display
     */
     func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == ( usersViewModel.getCellRepresentablesCount() - 1 ) {
            loadMoreData()
        }
        
        if usersViewModel.getCellRepresentablesCount() == usersViewModel.getHitsCount() {
            usersTable.tableFooterView = UIView.init(frame: .zero)
        }
    }
    
    /**
     Height For Row At
     */
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return usersViewModel.getRepresentableAt(index: indexPath.row).cellHeight
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
        
        let userProfileViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "UserProfileViewController") as! UserProfileViewController
        
        userProfileViewController.currentUser = self.usersViewModel.getUserAt(index: indexPath.row)
        
        self.navigationController?.pushViewController(userProfileViewController, animated: true)
    }

    /**
     Scroll View Did End Decelerating
     */
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        usersTable.tableHeaderView = nil
    }

}
