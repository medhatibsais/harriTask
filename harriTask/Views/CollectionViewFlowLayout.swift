//
//  CollectionViewFlowLayout.swift
//  harriTask
//
//  Created by Medhat Ibsais on 12/29/19.
//  Copyright © 2019 Medhat Ibsais. All rights reserved.
//

import UIKit

/// Collection View Flow Layout
class CollectionViewFlowLayout: UICollectionViewFlowLayout {
  
    /**
     Layout Attributes For Elements
     */
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let cellAttributesArray = super.layoutAttributesForElements(in: rect)
        var leftMargin: CGFloat = 10

        for attributes in cellAttributesArray! {
            let currentLayoutAttributes = attributes
            if leftMargin + currentLayoutAttributes.frame.size.width > rect.width {
                leftMargin = 10
            }
            var newLayoutFrame = currentLayoutAttributes.frame
            newLayoutFrame.origin.x = leftMargin
            currentLayoutAttributes.frame = newLayoutFrame
            leftMargin += currentLayoutAttributes.frame.size.width + 10
        }
        return cellAttributesArray
    }
    
    
//    var tempCellAttributesArray = [UICollectionViewLayoutAttributes]()
//    let leftEdgeInset: CGFloat = 10
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        let cellAttributesArray = super.layoutAttributesForElements(in: rect)
//        //Oth position cellAttr is InConvience Emoji Cell, from 1st onwards info cells are there, thats why we start count from 2nd position.
//        if(cellAttributesArray != nil && cellAttributesArray!.count > 1) {
//            for i in 1..<(cellAttributesArray!.count) {
//                let prevLayoutAttributes: UICollectionViewLayoutAttributes = cellAttributesArray![i - 1]
//                let currentLayoutAttributes: UICollectionViewLayoutAttributes = cellAttributesArray![i]
//                let maximumSpacing: CGFloat = 8
//                let prevCellMaxX: CGFloat = prevLayoutAttributes.frame.maxX
//                //UIEdgeInset 30 from left
//                let collectionViewSectionWidth = self.collectionViewContentSize.width - leftEdgeInset
//                let currentCellExpectedMaxX = prevCellMaxX + maximumSpacing + (currentLayoutAttributes.frame.size.width )
//                if currentCellExpectedMaxX < collectionViewSectionWidth {
//                    var frame: CGRect? = currentLayoutAttributes.frame
//                    frame?.origin.x = prevCellMaxX + maximumSpacing
//                    frame?.origin.y = prevLayoutAttributes.frame.origin.y
//                    currentLayoutAttributes.frame = frame ?? CGRect.zero
//                } else {
//                    // self.shiftCellsToCenter()
//                    currentLayoutAttributes.frame.origin.x = leftEdgeInset
//                    //To Avoid InConvience Emoji Cell
//                    if (prevLayoutAttributes.frame.origin.x != 0) {
//                        currentLayoutAttributes.frame.origin.y = prevLayoutAttributes.frame.origin.y + prevLayoutAttributes.frame.size.height + 08
//                    }
//                }
//                // print(currentLayoutAttributes.frame)
//            }
//            //print("Main For Loop End")
//        }
//        // self.shiftCellsToCenter()
//        return cellAttributesArray
//    }
//
//    func shiftCellsToCenter() {
//        if (tempCellAttributesArray.count == 0) {return}
//        let lastCellLayoutAttributes = self.tempCellAttributesArray[self.tempCellAttributesArray.count-1]
//        let lastCellMaxX: CGFloat = lastCellLayoutAttributes.frame.maxX
//        let collectionViewSectionWidth = self.collectionViewContentSize.width - leftEdgeInset
//        let xAxisDifference = collectionViewSectionWidth - lastCellMaxX
//        if xAxisDifference > 0 {
//            for each in self.tempCellAttributesArray{
//                each.frame.origin.x += xAxisDifference/2
//            }
//        }
//
//    }
}

