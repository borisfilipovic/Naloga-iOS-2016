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
            return BasketballFieldDatasource().getDrawFieldDataContext(context, frame: self.rect!)
        case .Football:
            return FootballFieldDatasource().getDrawFieldDataContext(context, frame: self.rect!)
        case .Tennis:
            return TennisFieldDatasource().getDrawFieldDataContext(context, frame: self.rect!)
        }
    }
    
    func setResultForHome(home: NSNumber?, andAway away: NSNumber?) {
        // TODO:
    }
    
    override func drawRect(rect: CGRect) {
        if let _ = sportType {
            var context = UIGraphicsGetCurrentContext()
            CGContextSetLineWidth(context, 1.0)
            CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
            context = getPath(forSportType: sportType!, andContext: context!)
            CGContextStrokePath(context)
        }
    }
}
