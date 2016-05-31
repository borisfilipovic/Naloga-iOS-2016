//
//  Data.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

struct Data {
    
    func getFootballFieldPath(width:CGFloat, height: CGFloat, rectWidth:CGFloat, rectHeight:CGFloat, marginX:CGFloat, marginY:CGFloat) -> CGPath {
        let lines = [[CGPoint(x: marginX, y: marginX), CGPoint(x: width, y: marginX), CGPoint(x: width, y: height - marginX), CGPoint(x: marginX, y: marginX)], [CGPoint(x: rectWidth * 0.5, y: marginX), CGPoint(x: rectWidth * 0.5, y: height - marginX)], [CGPoint(x: marginX, y: rectHeight * 0.5 - rectHeight * 0.3), CGPoint(x: marginX + width * 0.13, y: rectHeight * 0.5 - rectHeight * 0.3 ),CGPoint(x: marginX + width * 0.13, y: rectHeight * 0.5 + rectHeight * 0.3), CGPoint(x: marginX, y: rectHeight * 0.5 + rectHeight * 0.3)], [CGPoint(x: marginX, y: rectHeight * 0.5 - rectHeight * 0.15), CGPoint(x: marginX + width * 0.068, y: rectHeight * 0.5 - rectHeight * 0.15 ),CGPoint(x: marginX + width * 0.068, y: rectHeight * 0.5 + rectHeight * 0.15), CGPoint(x: marginX, y: rectHeight * 0.5 + rectHeight * 0.15)], [CGPoint(x: width, y: rectHeight * 0.5 - rectHeight * 0.3), CGPoint(x: width - width * 0.13, y: rectHeight * 0.5 - rectHeight * 0.3 ),CGPoint(x: width - width * 0.13, y: rectHeight * 0.5 + rectHeight * 0.3), CGPoint(x: width, y: rectHeight * 0.5 + rectHeight * 0.3)],[CGPoint(x: width, y: rectHeight * 0.5 - rectHeight * 0.15), CGPoint(x: width - width * 0.068, y: rectHeight * 0.5 - rectHeight * 0.15 ),CGPoint(x: width - width * 0.068, y: rectHeight * 0.5 + rectHeight * 0.15), CGPoint(x: width, y: rectHeight * 0.5 + rectHeight * 0.15)]]
        
        let circles = [
            true: [(rectWidth * 0.5), (height * 0.5), (height * 0.1572), 0, CGFloat(M_PI * 2)],
            true: [(marginX + width * 0.099), (rectHeight * 0.5), 1, 0, CGFloat(M_PI * 2)],
            true: [(marginX + width * 0.099), (rectHeight * 0.5), (height * 0.1572), CGFloat(-M_PI_2 + 0.43), CGFloat(M_PI_2 - 0.43)],
        ]
            
        return generatePath(lines, circles: circles)
    }
    
    func getTennisFieldPath(width:CGFloat, height: CGFloat, rectWidth:CGFloat, rectHeight:CGFloat, marginX:CGFloat, marginY:CGFloat) -> CGPath {
        
        let lines = [[CGPoint(x: marginX, y: marginX), CGPoint(x: width, y: marginX), CGPoint(x: width, y: height - marginX), CGPoint(x: marginX, y: height - marginX), CGPoint(x: marginX, y: marginX)],[CGPoint(x: marginX, y: height * 0.5 - height * 0.3647), CGPoint(x: width, y: height * 0.5 - height * 0.3647)], [CGPoint(x: marginX, y: height * 0.5 + height * 0.3647), CGPoint(x: width, y: height * 0.5 + height * 0.3647)], [CGPoint(x: rectWidth * 0.5, y: marginX), CGPoint(x: rectWidth * 0.5, y: height - marginX)],[CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5 - height * 0.3647), CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5 + height * 0.3647)], [CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 + height * 0.3647), CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 - height * 0.3647)], [CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 ), CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5)]]
        
        return generatePath(lines, circles: nil)
    }
    
    func getBasketballFieldPath(width:CGFloat, height: CGFloat, rectWidth:CGFloat, rectHeight:CGFloat, marginX:CGFloat, marginY:CGFloat) -> CGPath {
        
        let const1:CGFloat = 0.4227
        
        let lines = [[CGPoint(x: marginX, y: marginY), CGPoint(x: width, y: marginY), CGPoint(x: width, y: width * const1), CGPoint(x: marginX, y: width * const1), CGPoint(x: marginX, y: marginY)],
            [CGPoint(x: rectWidth * 0.5, y: marginY), CGPoint(x: rectWidth * 0.5, y: width * const1)],
            [CGPoint(x: marginX, y: rectHeight * 0.5), CGPoint(x: width * 0.112, y: rectHeight * 0.5 - rectHeight * 0.44)],
            [CGPoint(x: marginX, y: rectHeight * 0.5 + rectHeight * 0.44), CGPoint(x: width * 0.112, y: rectHeight * 0.5 + rectHeight * 0.44)],
            // Left side upper player position.
            [CGPoint(x: marginX + rectWidth * 0.06, y: rectHeight * 0.5 - rectHeight * 0.165 - 1), CGPoint(x: marginX + rectWidth * 0.06 + rectWidth * 0.0055, y: rectHeight * 0.5 - rectHeight * 0.165 - 1)],
            [CGPoint(x: marginX + rectWidth * 0.09, y: rectHeight * 0.5 - rectHeight * 0.165 - 1), CGPoint(x: marginX + rectWidth * 0.09 + rectWidth * 0.0136, y: rectHeight * 0.5 - rectHeight * 0.165 - 1)],
            [CGPoint(x: marginX + rectWidth * 0.1338, y: rectHeight * 0.5 - rectHeight * 0.165 - 1), CGPoint(x: marginX + rectWidth * 0.1338 + rectWidth * 0.0055, y: rectHeight * 0.5 - rectHeight * 0.165 - 1)],
            [CGPoint(x: marginX + rectWidth * 0.1638, y: rectHeight * 0.5 - rectHeight * 0.165 - 1), CGPoint(x: marginX + rectWidth * 0.1638 + rectWidth * 0.0055, y: rectHeight * 0.5 - rectHeight * 0.165 - 1)],
            // Left side lower player position.
            [CGPoint(x: marginX + rectWidth * 0.06, y: rectHeight * 0.5 + rectHeight * 0.165 + 1), CGPoint(x: marginX + rectWidth * 0.06 + rectWidth * 0.0055, y: rectHeight * 0.5 + rectHeight * 0.165 - 1)],
           [CGPoint(x: marginX + rectWidth * 0.09, y: rectHeight * 0.5 + rectHeight * 0.165 + 1), CGPoint(x: marginX + rectWidth * 0.09 + rectWidth * 0.00136, y: rectHeight * 0.5 + rectHeight * 0.165 - 1)],
           [CGPoint(x: marginX + rectWidth * 0.1338, y: rectHeight * 0.5 + rectHeight * 0.165 + 1), CGPoint(x: marginX + rectWidth * 0.1338 + rectWidth * 0.0055, y: rectHeight * 0.5 + rectHeight * 0.165 - 1)],
           [CGPoint(x: marginX + rectWidth * 0.1638, y: rectHeight * 0.5 + rectHeight * 0.165 + 1), CGPoint(x: marginX + rectWidth * 0.1638 + rectWidth * 0.0055, y: rectHeight * 0.5 + rectHeight * 0.165 - 1)],
           
            ]
        // [CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)]
        return generatePath(lines, circles: nil)
    }
    
    func generatePath(lines:[[CGPoint]]?, circles:[Bool:[CGFloat]]?)->CGPath {
        
        let path = UIBezierPath()
        
        // Convert points to line paths.
        if let _ = lines {
            for line in lines! {
                var counter = 0
                let length = line.count
                for point in line {
                    let tmpPath = UIBezierPath()
                    counter += 1
                    if counter == 1 {
                        tmpPath.moveToPoint(point)
                    } else if counter >= length {
                        tmpPath.addLineToPoint(point)
                        tmpPath.closePath()
                        path.appendPath(tmpPath)
                    } else {
                        tmpPath.addLineToPoint(point)
                    }
                }
            }
        }
        
        // Convert points to circle path.
        if let _ = circles {
            for (reverse, circle) in circles! {
                if circles!.count >= 5 {
                    let circlePath = UIBezierPath(
                        arcCenter: CGPoint(x: circle[0], y: circle[1]),
                        radius: circle[2],
                        startAngle: circle[3],
                        endAngle: circle[4],
                        clockwise: reverse
                    )
                    
                    path.appendPath(circlePath) // Append circle to path.
                }
            }
        }
        
        return path.CGPath
    }
}