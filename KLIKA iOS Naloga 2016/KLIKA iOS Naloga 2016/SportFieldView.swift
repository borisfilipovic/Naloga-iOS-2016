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
        
        let animatedView = UIView(frame: CGRect(origin: CGPoint(x: -160, y: UIScreen.mainScreen().bounds.height * 0.5), size: CGSize(width: 150, height: 100)))
        animatedView.backgroundColor = UIColor.whiteColor()
        
        let animatedText = UILabel(frame: CGRect(origin: CGPoint(x: animatedView.frame.size.width * 0.1, y: animatedView.frame.size.height * 0.1), size: CGSize(width: animatedView.frame.size.width * 0.8, height: animatedView.frame.size.height * 0.8)))
        animatedText.font.fontWithSize(20)
        animatedText.text =  "\(homeOldScore!.integerValue):\(awayOldScore!.integerValue)"
        animatedText.textAlignment = .Center
        
        animatedView.addSubview(animatedText)
        addSubview(animatedView)
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            animatedView.center.x = UIScreen.mainScreen().bounds.size.width * 0.5
            }, completion: { finished in
                UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    animatedText.alpha = 0
                    }, completion: { finished in
                        animatedText.text =  "\(self.homeCurrentScore!.integerValue):\(self.awayCurrentScore!.integerValue)"
                        self.homeOldScore = self.homeCurrentScore
                        self.awayOldScore = self.awayCurrentScore
                        UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                            animatedText.alpha = 1
                            }, completion: { finished in
                                UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                                    animatedView.center.x = UIScreen.mainScreen().bounds.size.width + animatedView.frame.size.width + 50
                                    }, completion: { finished in
                                        animatedView.center.x = UIScreen.mainScreen().bounds.size.width + animatedView.frame.size.width + 50
                                        animatedView.removeFromSuperview()
                                })
                        })
                })
        })
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
