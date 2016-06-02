//
//  ScoreAnimation.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 02/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class ScoreAnimation: UIView {

    func animateScore(homeOldScore:NSNumber, homeNewScore:NSNumber, awayOldScore:NSNumber, awayNewScore:NSNumber){
        
        let animatedView = UIView(frame: CGRect(origin: CGPoint(x: -160, y: UIScreen.mainScreen().bounds.height * 0.38), size: CGSize(width: 150, height: 100)))
        animatedView.backgroundColor = UIColor.whiteColor()
        
        let animatedText = UILabel(frame: CGRect(origin: CGPoint(x: animatedView.frame.size.width * 0.1, y: animatedView.frame.size.height * 0.1), size: CGSize(width: animatedView.frame.size.width * 0.8, height: animatedView.frame.size.height * 0.8)))
        animatedText.font.fontWithSize(20)
        animatedText.text =  "\(homeOldScore.integerValue):\(awayOldScore.integerValue)"
        animatedText.textAlignment = .Center
        
        animatedView.addSubview(animatedText)
        addSubview(animatedView)
        
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            animatedView.center.x = UIScreen.mainScreen().bounds.size.width * 0.5
            }, completion: { finished in
                UIView.animateWithDuration(2, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                    animatedText.alpha = 0
                    }, completion: { finished in
                        animatedText.text =  "\(homeNewScore.integerValue):\(awayNewScore.integerValue)"
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

}
