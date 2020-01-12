//
//  UserProfileTableDataSource.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/24/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// User Profile View Controller
extension UserProfileViewController: UITableViewDataSource {
    
    /**
     Number Of Sections
     */
    func numberOfSections(in tableView: UITableView) -> Int {
        return userInfoViewModel!.getAllCellsRepresentablesCount()
    }
    
    /**
     Number Of Rows In Section
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInfoViewModel!.numberOfRowsInTableView(sectionNumber: section)
        
    }
    
    /**
     Cell For Row At
     */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {

        /// Profile Image Cell
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageCell.getReusableIdentifier(), for: indexPath) as! ProfileImageCell
            
            cell.setupCellViews(imageCellRepresentable: userInfoViewModel!.getImageCellRepresentable(sectionNumber: indexPath.section))
            
            return cell
        
        /// About User Cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.getReusableIdentifier(), for: indexPath) as! AboutCell
            
            cell.userProfileDelegate = self
            cell.setViewsData(aboutCellRepresentable: userInfoViewModel!.getAboutUserCellRepresentable(sectionNumber: indexPath.section))
            
            return cell
        
        /// Experience Cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceCell.getReusableIdentifier(), for: indexPath) as! ExperienceCell
            
            if indexPath.row ==  0 {
                cell.isFirstCell = true
            }

            if indexPath.row == userInfoViewModel!.getExperienceCellRepresentablesCount(sectionNumber: indexPath.section) - 1 {
                cell.isLastCell = true
            }
            
            cell.setupViewsWith(experienceRepresentables: userInfoViewModel!.getExperienceUserCellRepresentable(indexPath: indexPath))
            
            return cell
            
            /// Skills Cell
            case 3:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: SkillsCell.getReusableIdentifier(), for: indexPath) as! SkillsCell
                
                cell.profileTableSection = 3
                cell.userProfileViewModel = self.userInfoViewModel
                cell.skillsCollectionView.reloadData()
                cell.layoutIfNeeded()
                return cell

        /// Availability Cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: SkillsCell.getReusableIdentifier(), for: indexPath) as! SkillsCell
            cell.profileTableSection = 4
            cell.userProfileViewModel = self.userInfoViewModel
            cell.skillsCollectionView.reloadData()
            cell.layoutIfNeeded()
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
}

