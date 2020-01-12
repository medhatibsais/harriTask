//
//  UserProfileCollectionDelegate.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Skills Cell
extension SkillsCell: UICollectionViewDelegateFlowLayout {

    /**
     Size For Item At
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let text = self.userProfileViewModel?.getSkillsOrAvailabilityText(sectionNumber: profileTableSection, itemIndex: indexPath.row)
        let cellWidth = text!.size(withAttributes:[.font: UIFont.systemFont(ofSize: 12.0)]).width + 50.0
        return CGSize(width: cellWidth, height: 25.0)
    }
}
