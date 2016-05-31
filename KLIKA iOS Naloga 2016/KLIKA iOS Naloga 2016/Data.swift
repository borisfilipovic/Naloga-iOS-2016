//
//  Data.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit


struct Data {
    
    func GetFieldData(forFieldType type:SportTypes, forViewSpec width:CGFloat, height: CGFloat, rectWidth:CGFloat, rectHeight:CGFloat, withMargins marginX:CGFloat, marginY:CGFloat) -> ([String:[CGPoint]]?,[Bool:[CGFloat]]?) {
        
        // Tennis.
        var linesDataTennis = [String:[CGPoint]]()
        var circleData = [Bool:[CGFloat]]()
        
        // Football.
        var linesDataFootball = [String:[CGPoint]]()
        var circleDataFootball = [Bool:[CGFloat]]()
        
        // Basketball.
        var linesDataBasketball = [String:[CGPoint]]()
        var circleDataBasketball = [Bool:[CGFloat]]()
        
        // Populate linesData.
        linesDataTennis = [
            "Outline":[CGPoint(x: marginX, y: marginX), CGPoint(x: width, y: marginX), CGPoint(x: width, y: height - marginX), CGPoint(x: marginX, y: height - marginX), CGPoint(x: marginX, y: marginX)],
            "TopHorLine":[CGPoint(x: marginX, y: height * 0.5 - height * 0.3647), CGPoint(x: width, y: height * 0.5 - height * 0.3647)],
            "BottomHorLine":[CGPoint(x: marginX, y: height * 0.5 + height * 0.3647), CGPoint(x: width, y: height * 0.5 + height * 0.3647)],
            "CenterLine":[CGPoint(x: rectWidth * 0.5, y: marginX), CGPoint(x: rectWidth * 0.5, y: height - marginX)],
            "Line4":[CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5 - height * 0.3647), CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5 + height * 0.3647)],
            "Line5":[CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 + height * 0.3647), CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 - height * 0.3647)],
            "Line6":[CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 ), CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5)]
            //"Line":[CGPoint(x: , y: ), CGPoint(x: , y: )]
        ]
        
        linesDataFootball = [
            "Outline":[CGPoint(x: marginX, y: marginX), CGPoint(x: width, y: marginX), CGPoint(x: width, y: height - marginX), CGPoint(x: marginX, y: marginX)],
            "Line1":[CGPoint(x: rectWidth * 0.5, y: marginX), CGPoint(x: rectWidth * 0.5, y: height - marginX)],
            "Line3":[CGPoint(x: marginX, y: rectHeight * 0.5 - rectHeight * 0.3), CGPoint(x: marginX + width * 0.13, y: rectHeight * 0.5 - rectHeight * 0.3 ),CGPoint(x: marginX + width * 0.13, y: rectHeight * 0.5 + rectHeight * 0.3), CGPoint(x: marginX, y: rectHeight * 0.5 + rectHeight * 0.3)],
            "Line4":[CGPoint(x: marginX, y: rectHeight * 0.5 - rectHeight * 0.15), CGPoint(x: marginX + width * 0.068, y: rectHeight * 0.5 - rectHeight * 0.15 ),CGPoint(x: marginX + width * 0.068, y: rectHeight * 0.5 + rectHeight * 0.15), CGPoint(x: marginX, y: rectHeight * 0.5 + rectHeight * 0.15)],
            "Line7":[CGPoint(x: width, y: rectHeight * 0.5 - rectHeight * 0.3), CGPoint(x: width - width * 0.13, y: rectHeight * 0.5 - rectHeight * 0.3 ),CGPoint(x: width - width * 0.13, y: rectHeight * 0.5 + rectHeight * 0.3), CGPoint(x: width, y: rectHeight * 0.5 + rectHeight * 0.3)],
            "Line8":[CGPoint(x: width, y: rectHeight * 0.5 - rectHeight * 0.15), CGPoint(x: width - width * 0.068, y: rectHeight * 0.5 - rectHeight * 0.15 ),CGPoint(x: width - width * 0.068, y: rectHeight * 0.5 + rectHeight * 0.15), CGPoint(x: width, y: rectHeight * 0.5 + rectHeight * 0.15)],
        ]
        
        circleDataFootball = [
            true: [(rectWidth * 0.5), (height * 0.5), (height * 0.1572), 0, CGFloat(M_PI * 2)], // Line 2 - Central circle.
            true: [(marginX + width * 0.099), (rectHeight * 0.5), 1, 0, CGFloat(M_PI * 2)], // Line 5 - Left penalty circle.
            true: [(marginX + width * 0.099), (rectHeight * 0.5), (height * 0.1572), CGFloat(-M_PI_2 + 0.43), CGFloat(M_PI_2 - 0.43)], // Line 6 - Left arc circle.
            // true: [(), (), (), 0, CGFloat(M_PI)]
        ]
        
        switch type {
        case .Football:
            return (linesDataFootball, circleDataFootball)
        case .Basketball:
            return(linesDataBasketball, circleDataBasketball)
        case .Tennis:
            return(linesDataTennis, nil)
        }
        
    }
    
}