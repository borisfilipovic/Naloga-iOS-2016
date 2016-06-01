//
//  SportFieldView.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 01/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class SportFieldView: UIView, MatchPitchProtocol, DrawShapesProtocol {
    
    var sportType: SportTypes?
    var size: CGSize?
    var rect: CGSize?
    var margin: CGSize?
    
    required init(sportType:SportTypes, size: CGSize, frame: CGRect, margin: CGSize) {
        self.sportType = sportType
        self.size = size
        self.rect = frame.size
        self.margin = margin
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func getPath(forSportType selector:SportTypes, andContext context:CGContext)->CGContext {
        switch selector {
        case .Basketball:
            return BasketballFieldDatasource().getDrawFieldDataContext(context, width: (self.size?.width)!, height: (self.size?.height)!, frame: self.rect!, marginX: self.margin!.width, marginY: self.margin!.width)
        case .Football:
            return FootballFieldDatasource().getDrawFieldDataContext(context, width: (self.size?.width)!, height: (self.size?.height)!, frame: self.rect!, marginX: self.margin!.width, marginY: self.margin!.width)
        case .Tennis:
            return TennisFieldDatasource().getDrawFieldDataContext(context, width: (self.size?.width)!, height: (self.size?.height)!, frame: self.rect!, marginX: self.margin!.width, marginY: self.margin!.width)
        }
    }
    
    func setResultForHome(home: NSNumber?, andAway away: NSNumber?) {
        // TODO:
    }
    
    override func drawRect(rect: CGRect) {
        print("je kdo mene klicu?")
        if let _ = sportType {
            // Prepare "paint brush".
            var context = UIGraphicsGetCurrentContext()
            CGContextSetLineWidth(context, 1.0) // Set line width.
            CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor) // Set color.
            context = getPath(forSportType: sportType!, andContext: context!)
            
            // Draw the path.
            CGContextStrokePath(context)
        }
    }
}
