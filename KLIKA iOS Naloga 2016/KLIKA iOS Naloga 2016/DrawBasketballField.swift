//
//  DrawBasketballField.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 28/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class DrawBasketballField: UIView {

    override func drawRect(rect: CGRect) {
        // Prepare "paint brush".
        let context = UIGraphicsGetCurrentContext() // Context is the object used for drawing.
        CGContextSetLineWidth(context, 1.0) // Set line width.
        CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor) // Set color.
        
        // Main width and margins.
        let width = CalcWidth(fromBaseRectWidth: rect.width, fromPercentage: 99)
        let _ = rect.height
        let marginX = CalcWidth(fromBaseRectWidth: rect.width, fromPercentage: 1)
        let marginY = rect.height - CalcWidth(fromBaseRectWidth: width, fromPercentage: 42.27)
        
        // Set path - Outline.
        CGContextMoveToPoint(context, marginX, marginY)
        CGContextAddLineToPoint(context, width, marginY)
        CGContextAddLineToPoint(context, width, CalcWidth(fromBaseRectWidth: width, fromPercentage: 42.27))
        CGContextAddLineToPoint(context, marginX, CalcWidth(fromBaseRectWidth: width, fromPercentage: 42.27))
        CGContextAddLineToPoint(context, marginX, marginY)
        
        // Set path - Middle line.
        CGContextMoveToPoint(context, rect.width * 0.5, marginY)
        CGContextAddLineToPoint(context, rect.width * 0.5, CalcWidth(fromBaseRectWidth: width, fromPercentage: 42.27))
        
        // Set path - Middle circle.
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:rect.width * 0.5,y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.1378),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePath.CGPath)
        
        
        
        
        /********** LEFT SIDE *************/
        // Outter line.
        CGContextMoveToPoint(context, marginX, rect.height * 0.5 - rect.height * 0.44)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2), rect.height * 0.5 - rect.height * 0.44)
        

        CGContextMoveToPoint(context, marginX, rect.height * 0.5 + rect.height * 0.44)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2), rect.height * 0.5 + rect.height * 0.44)
        
        // Set path - Left arc circle.
        let circlePathLeft = UIBezierPath(
            arcCenter: CGPoint(x:CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2),y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.44),
            startAngle: CGFloat(-M_PI_2),
            endAngle:CGFloat(M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathLeft.CGPath)
        
        
        
        // Inner line.
        CGContextMoveToPoint(context, marginX, rect.height * 0.5 - rect.height * 0.165)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), rect.height * 0.5 - rect.height * 0.165)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), rect.height * 0.5 + rect.height * 0.165)
        CGContextAddLineToPoint(context, marginX, rect.height * 0.5 + rect.height * 0.165)
        
        // Set path - Middle circle left.
        let circlePathLeftInner = UIBezierPath(
            arcCenter: CGPoint(x:CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76),y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.145),
            startAngle: CGFloat(-M_PI_2),
            endAngle:CGFloat(M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathLeftInner.CGPath)
        
        // Left side upper player positions.
        // 1.
        CGContextMoveToPoint(context, marginX + rect.width * 0.06, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.06 + rect.width * 0.0055, rect.height * 0.5 - rect.height * 0.165 - 1)
        // 2.
        CGContextMoveToPoint(context, marginX + rect.width * 0.09, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.09 + rect.width * 0.0136, rect.height * 0.5 - rect.height * 0.165 - 1)
        // 3.
        CGContextMoveToPoint(context, marginX + rect.width * 0.1338, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.1338 + rect.width * 0.0055, rect.height * 0.5 - rect.height * 0.165 - 1)
        // 4.
        CGContextMoveToPoint(context, marginX + rect.width * 0.1638, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.1638 + rect.width * 0.0055, rect.height * 0.5 - rect.height * 0.165 - 1)
        
        
        // Left side lower player positions.
        // 1.
        CGContextMoveToPoint(context, marginX + rect.width * 0.06, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.06 + rect.width * 0.0055, rect.height * 0.5 + rect.height * 0.165 + 1)
        
        
        // 2.
        CGContextMoveToPoint(context, marginX + rect.width * 0.09, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.09 + rect.width * 0.0136, rect.height * 0.5 + rect.height * 0.165 + 1)
        
        
        // 3.
        CGContextMoveToPoint(context, marginX + rect.width * 0.1338, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.1338 + rect.width * 0.0055, rect.height * 0.5 + rect.height * 0.165 + 1)
        
        
        // 4.
        CGContextMoveToPoint(context, marginX + rect.width * 0.1638, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.1638 + rect.width * 0.0055, rect.height * 0.5 + rect.height * 0.165 + 1)
        
        
        // Basketball rim left.
        // 1.
        CGContextMoveToPoint(context, marginX + rect.width * 0.0382, rect.height * 0.5 - rect.height * 0.065)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.0382, rect.height * 0.5 + rect.height * 0.065)
        
        
        // 2.
        CGContextMoveToPoint(context, marginX + rect.width * 0.0382, rect.height * 0.5)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.045, rect.height * 0.5)

        // 3.
        let circlePathRimLeft = UIBezierPath(
            arcCenter: CGPoint(x:marginX + rect.width * 0.051,y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.02),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePathRimLeft.CGPath)
        
        // Arc left.
        // 1. upper
        CGContextMoveToPoint(context, marginX + rect.width * 0.0409, rect.height * 0.5 - rect.height * 0.093)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.0628, rect.height * 0.5 - rect.height * 0.093)
        // 2. lower
        CGContextMoveToPoint(context, marginX + rect.width * 0.0409, rect.height * 0.5 + rect.height * 0.093)
        CGContextAddLineToPoint(context, marginX + rect.width * 0.0628, rect.height * 0.5 + rect.height * 0.093)
        // 3.
        let circlePathArcLeft = UIBezierPath(
            arcCenter: CGPoint(x:marginX + rect.width * 0.0628,y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.093),
            startAngle: CGFloat(-M_PI_2),
            endAngle:CGFloat(M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathArcLeft.CGPath)
        
        
        
        /********** RIGHT SIDE *************/
        CGContextMoveToPoint(context, width, rect.height * 0.5 - rect.height * 0.44)
        CGContextAddLineToPoint(context,width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2), rect.height * 0.5 - rect.height * 0.44)
        
        
        CGContextMoveToPoint(context, width, rect.height * 0.5 + rect.height * 0.44)
        CGContextAddLineToPoint(context, width - CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2) + marginX, rect.height * 0.5 + rect.height * 0.44)
        
        // Set path - Right arc circle.
        let circlePathRight = UIBezierPath(
            arcCenter: CGPoint(x:width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2),y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.44),
            startAngle: CGFloat(M_PI_4 + 0.7),
            endAngle:CGFloat(-M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathRight.CGPath)
        
        
        
        CGContextMoveToPoint(context, width, rect.height * 0.5 - rect.height * 0.165)
        CGContextAddLineToPoint(context,width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), rect.height * 0.5 - rect.height * 0.165)
        
        
        CGContextAddLineToPoint(context, width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), rect.height * 0.5 + rect.height * 0.165)
        CGContextAddLineToPoint(context, width, rect.height * 0.5 + rect.height * 0.165)
        
        // Set path - Middle circle left.
        let circlePathRightInner = UIBezierPath(
            arcCenter: CGPoint(x:width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76),y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.145),
            startAngle: CGFloat(M_PI_4 + 0.8),
            endAngle:CGFloat(-M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathRightInner.CGPath)
        
        // Right side upper player positions.
        // 1.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.06, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.06 + rect.width * 0.0055, rect.height * 0.5 - rect.height * 0.165 - 1)
        // 2.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.09, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.09 + rect.width * 0.0136, rect.height * 0.5 - rect.height * 0.165 - 1)
        // 3.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.1338, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.1338 + rect.width * 0.0055, rect.height * 0.5 - rect.height * 0.165 - 1)
        // 4.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.1638, rect.height * 0.5 - rect.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.1638 + rect.width * 0.0055, rect.height * 0.5 - rect.height * 0.165 - 1)
        
        // Right side lower player positions.
        // 1.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.06, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.06 + rect.width * 0.0055, rect.height * 0.5 + rect.height * 0.165 + 1)
        // 2.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.09, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.09 + rect.width * 0.0136, rect.height * 0.5 + rect.height * 0.165 + 1)
        // 3.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.1338, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.1338 + rect.width * 0.0055, rect.height * 0.5 + rect.height * 0.165 + 1)
        // 4.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.1638, rect.height * 0.5 + rect.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.1638 + rect.width * 0.0055, rect.height * 0.5 + rect.height * 0.165 + 1)
        
        // Basketball rim right.
        // 1.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.0382, rect.height * 0.5 - rect.height * 0.065)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.0382, rect.height * 0.5 + rect.height * 0.065)
        // 2.
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.0382, rect.height * 0.5)
        CGContextAddLineToPoint(context, width - marginX - rect.width * 0.045, rect.height * 0.5)
        // 3.
        let circlePathRimRight = UIBezierPath(
            arcCenter: CGPoint(x:width - marginX - rect.width * 0.051,y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.02),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePathRimRight.CGPath)
        
        // Arc right.
        // 1. upper
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.0409, rect.height * 0.5 - rect.height * 0.093)
        CGContextAddLineToPoint(context,width - marginX - rect.width * 0.0628, rect.height * 0.5 - rect.height * 0.093)
        // 2. upper
        CGContextMoveToPoint(context, width - marginX - rect.width * 0.0409, rect.height * 0.5 + rect.height * 0.093)
        CGContextAddLineToPoint(context,width - marginX - rect.width * 0.0628, rect.height * 0.5 + rect.height * 0.093)
        // 3.
        let circlePathArcRight = UIBezierPath(
            arcCenter: CGPoint(x:width - marginX - rect.width * 0.0628,y:rect.height * 0.5),
            radius: CGFloat(rect.height * 0.093),
            startAngle: CGFloat(M_PI_4 + 0.6),
            endAngle:CGFloat(-M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathArcRight.CGPath)
        
        // Draw the path.
        CGContextStrokePath(context)
    }
    
    func CalcWidth(fromBaseRectWidth _width: CGFloat, fromPercentage: CGFloat)->CGFloat{
        return ((_width * fromPercentage) / 100)
    }
    
    func GetPrt(height height: CGFloat, fromPercent: CGFloat) -> CGFloat{
        return ((fromPercent * 100) / height)
    }

}
