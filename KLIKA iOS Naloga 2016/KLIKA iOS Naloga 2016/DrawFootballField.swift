//
//  Draw.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 27/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class DrawFootballField: UIView {

    // MARK: - Draw field.
    override func drawRect(rect: CGRect) { // Drawing code
        // Prepare "paint brush".
        let context = UIGraphicsGetCurrentContext() // Context is the object used for drawing.
        CGContextSetLineWidth(context, 1.0) // Set line width.
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor) // Set color.
        
        // Variables.
        let width = ((rect.width * 98) / 100)
        let height = rect.height
        let marginX = CalcWidth(fromBaseRectWidth: rect.width, fromPercentage: 2)
        
        // Set path - Outline.
        CGContextMoveToPoint(context, marginX, marginX)
        CGContextAddLineToPoint(context, width, marginX)
        CGContextAddLineToPoint(context, width, height - marginX)
        CGContextAddLineToPoint(context, marginX, height - marginX)
        CGContextAddLineToPoint(context, marginX, marginX)
        
        // Line 1 - Center line.
        CGContextMoveToPoint(context, rect.width * 0.5, marginX)
        CGContextAddLineToPoint(context, rect.width * 0.5, height - marginX)
        
        // Line 2 - Center circle.
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:rect.width * 0.5,y:height * 0.5),
            radius: CGFloat( height * 0.1572),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePath.CGPath)
        
        /****** LEFT SIDE *******/
        // Line 3 - left outter goal square.
        CGContextMoveToPoint(context, marginX, rect.height * 0.5 - rect.height * 0.3)
        CGContextAddLineToPoint(context, marginX + width * 0.13, rect.height * 0.5 - rect.height * 0.3)
        CGContextAddLineToPoint(context, marginX + width * 0.13, rect.height * 0.5 + rect.height * 0.3)
        CGContextAddLineToPoint(context, marginX, rect.height * 0.5 + rect.height * 0.3)
        
        // Line 4 - left inner goal square.
        CGContextMoveToPoint(context, marginX, rect.height * 0.5 - rect.height * 0.15)
        CGContextAddLineToPoint(context, marginX + width * 0.068, rect.height * 0.5 - rect.height * 0.15)
        CGContextAddLineToPoint(context, marginX + width * 0.068, rect.height * 0.5 + rect.height * 0.15)
        CGContextAddLineToPoint(context, marginX, rect.height * 0.5 + rect.height * 0.15)
        
        // Line 5 - Left penalty circle.
        let circlePath1 = UIBezierPath(
            arcCenter: CGPoint(x:marginX + width * 0.099, y:rect.height * 0.5),
            radius: CGFloat(1),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePath1.CGPath)
        
        // Line 6 - Left arc circle.
        let circlePath2 = UIBezierPath(
            arcCenter: CGPoint(x:marginX + width * 0.099, y:rect.height * 0.5),
            radius: CGFloat( height * 0.1572),
            startAngle: CGFloat(-M_PI_2 + 0.43),
            endAngle:CGFloat(M_PI_2 - 0.43),
            clockwise: true)
        CGContextAddPath(context, circlePath2.CGPath)
        
        /****** RIGHT SIDE *******/
        // Line 7 - Right outter goal square.
        CGContextMoveToPoint(context, width, rect.height * 0.5 - rect.height * 0.3)
        CGContextAddLineToPoint(context, width - width * 0.13, rect.height * 0.5 - rect.height * 0.3)
        CGContextAddLineToPoint(context, width - width * 0.13, rect.height * 0.5 + rect.height * 0.3)
        CGContextAddLineToPoint(context, width, rect.height * 0.5 + rect.height * 0.3)
        
        // Line 8 - right inner goal square.
        CGContextMoveToPoint(context, width, rect.height * 0.5 - rect.height * 0.15)
        CGContextAddLineToPoint(context, width - width * 0.068, rect.height * 0.5 - rect.height * 0.15)
        CGContextAddLineToPoint(context, width - width * 0.068, rect.height * 0.5 + rect.height * 0.15)
        CGContextAddLineToPoint(context, width, rect.height * 0.5 + rect.height * 0.15)
        
        // Line 9 - Right penalty circle.
        let circlePath3 = UIBezierPath(
            arcCenter: CGPoint(x:width - width * 0.099, y:rect.height * 0.5),
            radius: CGFloat(1),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePath3.CGPath)
        
        // Line 10 - Right arc circle.
        let circlePath4 = UIBezierPath(
            arcCenter: CGPoint(x:width - width * 0.099, y:rect.height * 0.5),
            radius: CGFloat( height * 0.1572),
            startAngle: CGFloat(M_PI_4 + 1.25),
            endAngle:CGFloat(-M_PI_2 - 0.45),
            clockwise: true)
        CGContextAddPath(context, circlePath4.CGPath)

        // Draw the path.
        CGContextStrokePath(context)
    }
    
    func CalcWidth(fromBaseRectWidth _width: CGFloat, fromPercentage: CGFloat)->CGFloat{
        return ((_width * fromPercentage) / 100)
    }
}
