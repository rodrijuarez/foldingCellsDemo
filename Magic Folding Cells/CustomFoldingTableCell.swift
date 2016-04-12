//
//  CustomFoldingTableCell.swift
//  Magic Folding Cells
//
//  Created by Rodrigo Alejandro Juarez on 4/12/16.
//  Copyright © 2016 Rodrigo Alejandro Juarez. All rights reserved.
//

import Foundation
import FoldingCell

class CustomFoldingTableCell:FoldingCell {
    override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
        
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26] // timing animation for each view
        return durations[itemIndex]
    }
}