//
//  FootballVC.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 29/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class FootballCV:UIViewController, MatchPitchProtocol {
    
    var vc:UIViewController?
    var sportTypeView:UIView?
    //var drawFieldView:DrawFootballField?
    var scoreAnimatedViewSize = CGSize(width: 150, height: 100)
    var animatedView = UIView()
    var animatedText = UILabel()
    
    // Score tracking variables.
    var homeCurrentScore:NSNumber = 0
    var awayCurrentScore:NSNumber = 0
    
    var homeOldScore:NSNumber = 0
    var awayOldScore:NSNumber = 0
    
    // MARK: - Init functions.
    func configureViewController(controller:ViewController)->UIViewController{
        vc = UIViewController()
        controller.delegate = self
        return vc!
    }
    
    func initUIView(frame _frame: CGRect)->UIView?{
        // 1. Create main UIView.
        sportTypeView = UIView(frame: _frame)
        sportTypeView?.backgroundColor = UIColor.grayColor()
        
        // 2. Create football field.
        //drawFieldView = DrawFootballField(frame: CGRect(x: 0, y: 10, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.width * 0.4175 + 10))
        //drawFieldView?.backgroundColor = UIColor.grayColor()
        //sportTypeView?.addSubview(drawFieldView!)
        
        return sportTypeView!
    }
    
    // MARK: - Handle and store score.
    func storeScore(home _home:NSNumber?, andAway _away:NSNumber?){
        if let _ = _home where homeCurrentScore.integerValue < _home!.integerValue {homeCurrentScore = _home!}
        if let _ = _away where awayCurrentScore.integerValue < _away?.integerValue {awayCurrentScore = _away!}
    }
    
    // MARK: - Change score animation.
    func changeScore(){
        // Animated view container.
        animatedView = UIView(frame: CGRect(origin: CGPoint(x: -scoreAnimatedViewSize.width - 10, y: sportTypeView!.frame.height * 0.5), size: CGSize(width: scoreAnimatedViewSize.width, height: scoreAnimatedViewSize.height)))
        animatedView.backgroundColor = UIColor.whiteColor()
        
        // Animated text.
        animatedText = UILabel(frame: CGRect(origin: CGPoint(x: animatedView.frame.size.width * 0.1, y: animatedView.frame.size.height * 0.1), size: CGSize(width: animatedView.frame.size.width * 0.8, height: animatedView.frame.size.height * 0.8)))
        animatedText.text =  "\(homeOldScore.integerValue):\(awayOldScore.integerValue)"
        animatedText.textAlignment = .Center
        
        // Add to view.
        animatedView.addSubview(animatedText)
        sportTypeView!.addSubview(animatedView)
        
        animateSlideFromLeft() // Start animation.
    }
    
    func animateSlideFromLeft(){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.animatedView.center.x = UIScreen.mainScreen().bounds.size.width * 0.5
                }, completion: { finished in
                    self.animateChangeText()
            })
        })
    }
    
    func animateChangeText(){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.animatedText.text =  "\(self.homeCurrentScore.integerValue):\(self.awayCurrentScore.integerValue)"
                
                // Update old score to current score.
                self.homeOldScore = self.homeCurrentScore
                self.awayOldScore = self.awayCurrentScore
                
                }, completion: { finished in
                    self.animateSlideToRight()
            })
        })
    }
    
    func animateSlideToRight(){
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            // Animate the transition
            UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
                self.animatedView.center.x = UIScreen.mainScreen().bounds.size.width + self.animatedView.bounds.size.width + 20
                }, completion: { finished in
                    self.animatedView.removeFromSuperview() // remove the views.
            })
        })
    }
    
    // MARK: - MatchPitProtocol method.
    func setResultForHome(home: NSNumber?, andAway: NSNumber?) {
        if let _ = home where home!.integerValue > homeCurrentScore.integerValue {homeCurrentScore = home!}
        if let _ = andAway where andAway!.integerValue > awayCurrentScore.integerValue {awayCurrentScore = andAway!}
        changeScore()
    }
}
