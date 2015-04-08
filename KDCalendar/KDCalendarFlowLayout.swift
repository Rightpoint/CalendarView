//
//  KDCalendarFlowLayout.swift
//  KDCalendar
//
//  Created by Michael Michailidis on 02/04/2015.
//  Copyright (c) 2015 Karmadust. All rights reserved.
//

import UIKit

class KDCalendarFlowLayout: UICollectionViewFlowLayout {
    
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        
        return (super.layoutAttributesForElementsInRect(rect) as [UICollectionViewLayoutAttributes]).map {
            attrs in
            self.applyLayoutAttributes(attrs)
            return attrs
        }
        
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        
        let attr = super.layoutAttributesForItemAtIndexPath(indexPath)
        self.applyLayoutAttributes(attr)
        return attr
        
    }
    
    
    func applyLayoutAttributes(attributes : UICollectionViewLayoutAttributes) {
        
        
        
        if let collectionView = self.collectionView {
            
            let xPageOffset = CGFloat(attributes.indexPath.section) * collectionView.frame.size.width
            
            if attributes.representedElementKind != nil {
                
                if attributes.representedElementKind == UICollectionElementKindSectionHeader {
                    
                    attributes.frame = CGRect(x: xPageOffset, y: 0.0, width: self.headerReferenceSize.width, height: self.headerReferenceSize.height)
                    
                }
                
            }
            else {
                
                var xCellOffset : CGFloat = xPageOffset + (CGFloat(attributes.indexPath.item % 7) * self.itemSize.width)
                
                var yCellOffset : CGFloat = self.headerReferenceSize.height + (CGFloat(attributes.indexPath.item / 7) * self.itemSize.width)
                
                attributes.frame = CGRectMake(xCellOffset, yCellOffset, self.itemSize.width, self.itemSize.height)
                
            }
            
            
            
        }
        
    }
    
}
