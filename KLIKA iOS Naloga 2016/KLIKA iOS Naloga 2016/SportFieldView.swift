//
//  SportFieldView.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 01/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class SportFieldView: UIView, MatchPitchProtocol, DrawShapesProtocol {
    
    var animateScore = ScoreAnimation()
    var sportType: SportTypes?
    var size: CGSize?
    var rect: CGSize?
    var margin: CGSize?
    var homeCurrentScore: NSNumber?
    var awayCurrentScore: NSNumber?
    var homeOldScore: NSNumber?
    var awayOldScore: NSNumber?
    
    required init(sportType:SportTypes, size: CGSize, frame: CGRect, margin: CGSize) {
        self.sportType = sportType
        self.size = size
        self.rect = frame.size
        self.margin = margin
        self.homeCurrentScore = 0
        self.awayCurrentScore = 0
        self.homeOldScore = 0
        self.awayOldScore = 0
        super.init(frame: frame)
        backgroundColor = UIColor.grayColor()
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
    
    func setDelegate(controller:ViewController){controller.delegate = self}
    
    func setResultForHome(home: NSNumber?, andAway away: NSNumber?) {
        if let _ = home where home!.integerValue > homeCurrentScore!.integerValue {homeCurrentScore = home!}
        if let _ = away where away!.integerValue > awayCurrentScore!.integerValue {awayCurrentScore = away!}
        
        animateScore = ScoreAnimation(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: UIScreen.mainScreen().bounds.height, height: UIScreen.mainScreen().bounds.height)))
        addSubview(animateScore)
        animateScore.animateScore(homeOldScore!, homeNewScore: homeCurrentScore!, awayOldScore: awayOldScore!, awayNewScore: awayCurrentScore!)
        homeOldScore = homeCurrentScore
        awayOldScore = awayCurrentScore
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
