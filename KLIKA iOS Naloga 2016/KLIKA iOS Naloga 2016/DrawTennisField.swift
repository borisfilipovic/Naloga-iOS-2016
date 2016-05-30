//
//  DrawTennisField.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 29/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class DrawTennisField: UIView {

    override func drawRect(rect: CGRect) {
        // Prepare "paint brush".
        let context = UIGraphicsGetCurrentContext() // Context is the object used for drawing.
        CGContextSetLineWidth(context, 1.0) // Set line width.
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor) // Set color.
        
        // Variables.
        let width = ((rect.width * 99) / 100)
        let height = rect.height
        let marginX = CalcWidth(fromBaseRectWidth: rect.width, fromPercentage: 1)

        
        // Set path - Outline.
        CGContextMoveToPoint(context, marginX, marginX)
        CGContextAddLineToPoint(context, width, marginX)
        CGContextAddLineToPoint(context, width, height - marginX)
        CGContextAddLineToPoint(context, marginX, height - marginX)
        CGContextAddLineToPoint(context, marginX, marginX)
        
        // Line 1 (Top most full length horizontal line).
        CGContextMoveToPoint(context, marginX, height * 0.5 - height * 0.3647)
        CGContextAddLineToPoint(context, width, height * 0.5 - height * 0.3647)

        // Line 2 (Bottom most full length horizontal line).
        CGContextMoveToPoint(context, marginX, height * 0.5 + height * 0.3647)
        CGContextAddLineToPoint(context, width, height * 0.5 + height * 0.3647)
        
        // Line 3 - Center line.
        CGContextMoveToPoint(context, rect.width * 0.5, marginX)
        CGContextAddLineToPoint(context, rect.width * 0.5, height - marginX)
        
        // Line 4 - Top second most horizontal line.
        CGContextMoveToPoint(context, rect.width * 0.5 - rect.width * 0.2607, height * 0.5 - height * 0.3647)
        CGContextAddLineToPoint(context, rect.width * 0.5 - rect.width * 0.2607, height * 0.5 + height * 0.3647)
        
        // Line 5 - Bottom second most horizontal line.
        CGContextMoveToPoint(context, rect.width * 0.5 + rect.width * 0.2607, height * 0.5 + height * 0.3647)
        CGContextAddLineToPoint(context, rect.width * 0.5 + rect.width * 0.2607, height * 0.5 - height * 0.3647)
        
        // Line 6 - Center horizontal line.
        CGContextMoveToPoint(context, rect.width * 0.5 + rect.width * 0.2607, height * 0.5)
        CGContextAddLineToPoint(context, rect.width * 0.5 - rect.width * 0.2607, height * 0.5)
        
        // Draw the path.
        CGContextStrokePath(context)
    }
    
    func CalcWidth(fromBaseRectWidth _width: CGFloat, fromPercentage: CGFloat)->CGFloat{
        return ((_width * fromPercentage) / 100)
    }
    
    func GetValue(fromHeight height: CGFloat, fromPercent: CGFloat) -> CGFloat{
        return ((fromPercent * 100) / height)
    }
}
