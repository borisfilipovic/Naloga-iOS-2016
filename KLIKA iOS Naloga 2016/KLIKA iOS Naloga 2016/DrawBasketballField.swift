//
//  DrawBasketballField.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 28/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

struct BasketballFieldDatasource:SportTypeDatasourceProtocol {
    
    func getDrawFieldDataContext(context: CGContext, frame: CGSize) -> CGContext {
        
        // Main width and margins.
        let width = frame.width * 0.99
        let marginX = frame.width * 0.01
        let marginY = frame.height * 0.01

        // Set path - Outline.
        CGContextMoveToPoint(context, marginX, marginY)
        CGContextAddLineToPoint(context, frame.width - marginX, marginY)
        CGContextAddLineToPoint(context, width, frame.height - marginY)
        CGContextAddLineToPoint(context, marginX, frame.height - marginY)
        CGContextAddLineToPoint(context, marginX, frame.height - marginY)
        CGContextAddLineToPoint(context, marginX, marginY)
        
        // Set path - Middle line.
        CGContextMoveToPoint(context, frame.width * 0.5, marginY)
        CGContextAddLineToPoint(context, frame.width * 0.5, frame.height - marginY)

        // Set path - Middle circle.
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x:frame.width * 0.5,y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.1378),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePath.CGPath)
        
        /********** LEFT SIDE *************/
        // Outter line.
        CGContextMoveToPoint(context, marginX, frame.height * 0.5 - frame.height * 0.44)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2), frame.height * 0.5 - frame.height * 0.44)
        
        
        CGContextMoveToPoint(context, marginX, frame.height * 0.5 + frame.height * 0.44)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2), frame.height * 0.5 + frame.height * 0.44)
        
        // Set path - Left arc circle.
        let circlePathLeft = UIBezierPath(
            arcCenter: CGPoint(x:CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2),y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.44),
            startAngle: CGFloat(-M_PI_2),
            endAngle:CGFloat(M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathLeft.CGPath)

        // Inner line.
        CGContextMoveToPoint(context, marginX, frame.height * 0.5 - frame.height * 0.165)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), frame.height * 0.5 - frame.height * 0.165)
        CGContextAddLineToPoint(context, CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), frame.height * 0.5 + frame.height * 0.165)
        CGContextAddLineToPoint(context, marginX, frame.height * 0.5 + frame.height * 0.165)
        
        // Set path - Middle circle left.
        let circlePathLeftInner = UIBezierPath(
            arcCenter: CGPoint(x:CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76),y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.145),
            startAngle: CGFloat(-M_PI_2),
            endAngle:CGFloat(M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathLeftInner.CGPath)
        
        // Left side upper player positions.
        // 1.
        CGContextMoveToPoint(context, marginX + frame.width * 0.06, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.06 + frame.width * 0.0055, frame.height * 0.5 - frame.height * 0.165 - 1)
        // 2.
        CGContextMoveToPoint(context, marginX + frame.width * 0.09, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.09 + frame.width * 0.0136, frame.height * 0.5 - frame.height * 0.165 - 1)
        // 3.
        CGContextMoveToPoint(context, marginX + frame.width * 0.1338, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.1338 + frame.width * 0.0055, frame.height * 0.5 - frame.height * 0.165 - 1)
        // 4.
        CGContextMoveToPoint(context, marginX + frame.width * 0.1638, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.1638 + frame.width * 0.0055, frame.height * 0.5 - frame.height * 0.165 - 1)
        
        
        // Left side lower player positions.
        // 1.
        CGContextMoveToPoint(context, marginX + frame.width * 0.06, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.06 + frame.width * 0.0055, frame.height * 0.5 + frame.height * 0.165 + 1)
        
        
        // 2.
        CGContextMoveToPoint(context, marginX + frame.width * 0.09, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.09 + frame.width * 0.0136, frame.height * 0.5 + frame.height * 0.165 + 1)
        
        
        // 3.
        CGContextMoveToPoint(context, marginX + frame.width * 0.1338, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.1338 + frame.width * 0.0055, frame.height * 0.5 + frame.height * 0.165 + 1)
        
        
        // 4.
        CGContextMoveToPoint(context, marginX + frame.width * 0.1638, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.1638 + frame.width * 0.0055, frame.height * 0.5 + frame.height * 0.165 + 1)
        
        
        // Basketball rim left.
        // 1.
        CGContextMoveToPoint(context, marginX + frame.width * 0.0382, frame.height * 0.5 - frame.height * 0.065)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.0382, frame.height * 0.5 + frame.height * 0.065)
        
        
        // 2.
        CGContextMoveToPoint(context, marginX + frame.width * 0.0382, frame.height * 0.5)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.045, frame.height * 0.5)
        
        // 3.
        let circlePathRimLeft = UIBezierPath(
            arcCenter: CGPoint(x:marginX + frame.width * 0.051,y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.02),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePathRimLeft.CGPath)
        
        // Arc left.
        // 1. upper
        CGContextMoveToPoint(context, marginX + frame.width * 0.0409, frame.height * 0.5 - frame.height * 0.093)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.0628, frame.height * 0.5 - frame.height * 0.093)
        // 2. lower
        CGContextMoveToPoint(context, marginX + frame.width * 0.0409, frame.height * 0.5 + frame.height * 0.093)
        CGContextAddLineToPoint(context, marginX + frame.width * 0.0628, frame.height * 0.5 + frame.height * 0.093)
        // 3.
        let circlePathArcLeft = UIBezierPath(
            arcCenter: CGPoint(x:marginX + frame.width * 0.0628,y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.093),
            startAngle: CGFloat(-M_PI_2),
            endAngle:CGFloat(M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathArcLeft.CGPath)
        
        
        
        /********** RIGHT SIDE *************/
        CGContextMoveToPoint(context, width, frame.height * 0.5 - frame.height * 0.44)
        CGContextAddLineToPoint(context,width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2), frame.height * 0.5 - frame.height * 0.44)
        
        
        CGContextMoveToPoint(context, width, frame.height * 0.5 + frame.height * 0.44)
        CGContextAddLineToPoint(context, width - CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2) + marginX, frame.height * 0.5 + frame.height * 0.44)
        
        // Set path - Right arc circle.
        let circlePathRight = UIBezierPath(
            arcCenter: CGPoint(x:width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 11.2),y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.44),
            startAngle: CGFloat(M_PI_4 + 0.7),
            endAngle:CGFloat(-M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathRight.CGPath)
        
        
        
        CGContextMoveToPoint(context, width, frame.height * 0.5 - frame.height * 0.165)
        CGContextAddLineToPoint(context,width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), frame.height * 0.5 - frame.height * 0.165)
        
        
        CGContextAddLineToPoint(context, width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76), frame.height * 0.5 + frame.height * 0.165)
        CGContextAddLineToPoint(context, width, frame.height * 0.5 + frame.height * 0.165)
        
        // Set path - Middle circle left.
        let circlePathRightInner = UIBezierPath(
            arcCenter: CGPoint(x:width + marginX - CalcWidth(fromBaseRectWidth: width, fromPercentage: 20.76),y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.145),
            startAngle: CGFloat(M_PI_4 + 0.8),
            endAngle:CGFloat(-M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathRightInner.CGPath)
        
        // Right side upper player positions.
        // 1.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.06, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.06 + frame.width * 0.0055, frame.height * 0.5 - frame.height * 0.165 - 1)
        // 2.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.09, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.09 + frame.width * 0.0136, frame.height * 0.5 - frame.height * 0.165 - 1)
        // 3.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.1338, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.1338 + frame.width * 0.0055, frame.height * 0.5 - frame.height * 0.165 - 1)
        // 4.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.1638, frame.height * 0.5 - frame.height * 0.165 - 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.1638 + frame.width * 0.0055, frame.height * 0.5 - frame.height * 0.165 - 1)
        
        // Right side lower player positions.
        // 1.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.06, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.06 + frame.width * 0.0055, frame.height * 0.5 + frame.height * 0.165 + 1)
        // 2.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.09, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.09 + frame.width * 0.0136, frame.height * 0.5 + frame.height * 0.165 + 1)
        // 3.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.1338, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.1338 + frame.width * 0.0055, frame.height * 0.5 + frame.height * 0.165 + 1)
        // 4.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.1638, frame.height * 0.5 + frame.height * 0.165 + 1)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.1638 + frame.width * 0.0055, frame.height * 0.5 + frame.height * 0.165 + 1)
        
        // Basketball rim right.
        // 1.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.0382, frame.height * 0.5 - frame.height * 0.065)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.0382, frame.height * 0.5 + frame.height * 0.065)
        // 2.
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.0382, frame.height * 0.5)
        CGContextAddLineToPoint(context, width - marginX - frame.width * 0.045, frame.height * 0.5)
        // 3.
        let circlePathRimRight = UIBezierPath(
            arcCenter: CGPoint(x:width - marginX - frame.width * 0.051,y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.02),
            startAngle: CGFloat(0),
            endAngle:CGFloat(M_PI * 2),
            clockwise: true)
        CGContextAddPath(context, circlePathRimRight.CGPath)
        
        // Arc right.
        // 1. upper
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.0409, frame.height * 0.5 - frame.height * 0.093)
        CGContextAddLineToPoint(context,width - marginX - frame.width * 0.0628, frame.height * 0.5 - frame.height * 0.093)
        // 2. upper
        CGContextMoveToPoint(context, width - marginX - frame.width * 0.0409, frame.height * 0.5 + frame.height * 0.093)
        CGContextAddLineToPoint(context,width - marginX - frame.width * 0.0628, frame.height * 0.5 + frame.height * 0.093)
        // 3.
        let circlePathArcRight = UIBezierPath(
            arcCenter: CGPoint(x:width - marginX - frame.width * 0.0628,y:frame.height * 0.5),
            radius: CGFloat(frame.height * 0.093),
            startAngle: CGFloat(M_PI_4 + 0.6),
            endAngle:CGFloat(-M_PI_2),
            clockwise: true)
        CGContextAddPath(context, circlePathArcRight.CGPath)
        
        // Draw the path.
        return context
    }
    
    func CalcWidth(fromBaseRectWidth _width: CGFloat, fromPercentage: CGFloat)->CGFloat{
        return ((_width * fromPercentage) / 100)
    }
}