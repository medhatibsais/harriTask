//
//  Extensions+TableViewDataSource.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/3/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Users Table View Controller
extension UsersTableViewController: UITableViewDataSource {
    /**
     Number Of Sections
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        }
    /**
     Number Of Rows In Section
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersViewModel.getCellRepresentablesCount()
        }
    /**
     Cell For Row At
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = usersTable.dequeueReusableCell(withIdentifier: usersViewModel.getRepresentableAt(index: indexPath.row).cellReuseIdentifier, for: indexPath) as! UserCell
            
            cell.setupCellViews(cellRepresentable: usersViewModel.getRepresentableAt(index: indexPath.row))
                
            return cell
        }
}
