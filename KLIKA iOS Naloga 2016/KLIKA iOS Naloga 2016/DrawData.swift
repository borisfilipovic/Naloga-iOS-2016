//
//  DrawData.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

struct DrawData: DrawShapesProtocol {
    
    var paths: [CGPath]?
    
    mutating func generatePath(fromPoints points: [String : [CGPoint]], andCircleFrom params: [Bool : [CGFloat]]) -> [CGPath]? {
        for (_, shapeContainer) in points {
            let path = UIBezierPath()
            let numberOfShapes = shapeContainer.count
            var counter = -1
            for point in shapeContainer {
                counter += 1
                if(counter == 0){ // First point.
                    path.moveToPoint(point)
                } else if counter == numberOfShapes - 1 { // Last point.
                    path.addLineToPoint(point)
                    path.closePath()
                    paths?.append(path.CGPath) // Append finished path to paths array.
                } else {
                    path.addLineToPoint(point)
                }
            }
        }
        
        for (isClockwise, circleContainer) in params {
            if circleContainer.count >= 5 {
                let circlePath = UIBezierPath(arcCenter: CGPoint(x: circleContainer[0], y: circleContainer[1]), radius: circleContainer[2], startAngle: circleContainer[3], endAngle: circleContainer[4], clockwise: isClockwise)
                paths?.append(circlePath.CGPath) // Add circle path to array.
            }
        }
        
        return paths
    }

}