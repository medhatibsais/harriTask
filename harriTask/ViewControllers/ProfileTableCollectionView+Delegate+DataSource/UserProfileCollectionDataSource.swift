//
//  UserProfileCollectionDataSource.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Skills Cell
extension SkillsCell: UICollectionViewDataSource {
    
    /**
     Number Of Items In Section
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        userProfileViewModel!.numberOfItems(sectionNumber: profileTableSection)
    }
    
    /**
     Cell For Item At
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CheckSkillsCollectionCell.getReusableIdentifier(), for: indexPath) as! CheckSkillsCollectionCell
        
        let skillView = userProfileViewModel?.checkListWithLabel(labelValueIndex: indexPath.row,sectionNumber: profileTableSection)
        
        skillView!.frame = cell.bounds
        cell.addSubview(skillView!)

        return cell
        
    }
    
}
