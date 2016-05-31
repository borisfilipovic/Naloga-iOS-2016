//
//  Data.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit


struct Data {
    
    func GetTennisFieldData(forViewSpec width:CGFloat, height: CGFloat, rectWidth:CGFloat, rectHeight:CGFloat, withMargins marginX:CGFloat, marginY:CGFloat) -> ([String:[CGPoint]],[Bool:[CGFloat]]) {
        
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
        linesData = [
            "Outline":[CGPoint(x: marginX, y: marginX), CGPoint(x: width, y: marginX), CGPoint(x: width, y: height - marginX), CGPoint(x: marginX, y: height - marginX), CGPoint(x: marginX, y: marginX)],
            "TopHorLine":[CGPoint(x: marginX, y: height * 0.5 - height * 0.3647), CGPoint(x: width, y: height * 0.5 - height * 0.3647)],
            "BottomHorLine":[CGPoint(x: marginX, y: height * 0.5 + height * 0.3647), CGPoint(x: width, y: height * 0.5 + height * 0.3647)],
            "CenterLine":[CGPoint(x: rectWidth * 0.5, y: marginX), CGPoint(x: rectWidth * 0.5, y: height - marginX)],
            "Line4":[CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5 - height * 0.3647), CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5 + height * 0.3647)],
            "Line5":[CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 + height * 0.3647), CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 - height * 0.3647)],
            "Line6":[CGPoint(x: rectWidth * 0.5 + rectWidth * 0.2607, y: height * 0.5 ), CGPoint(x: rectWidth * 0.5 - rectWidth * 0.2607, y: height * 0.5)]
            //"Line":[CGPoint(x: , y: ), CGPoint(x: , y: )]
        ]
        
        return (linesData, circleData)
        
    }
    
}