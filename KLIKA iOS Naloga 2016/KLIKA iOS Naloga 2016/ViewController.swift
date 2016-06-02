//
//  ViewController.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 27/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ViewControllerProtocol{
    
    var parentView:SportFieldView?
    var scrollView:UIScrollView?
    var segmentedControll:UISegmentedControl?
    var scoreLabel = UILabel()
    var inputTextField1 = UITextField()
    var inputTextField2 = UITextField()
    var tapRecognize:UITapGestureRecognizer?
    let constructor = GUIConstructor() // GUI constructor.
    let helperUtil = HelperMethods()
    var delegate:MatchPitchProtocol? // Protocol delegate.
    var homeCurrentScore:NSNumber = 0
    var awayCurrentScore:NSNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        createView()
        handleDraw(SportTypes.Football, height: UIScreen.mainScreen().bounds.width * 0.4175 + 30)
    }
    
    func createView() {
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: view.bounds.size))
        view.addSubview(scrollView!)
    
        segmentedControll = constructor.getSegmentedControll(["Football", "Basketball", "Tennis"], center: CGPoint(x: UIScreen.mainScreen().bounds.width * 0.5, y: 60))
        segmentedControll?.addTarget(self, action: #selector(ViewController.segmentChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        scrollView?.addSubview(segmentedControll!)
        
        inputTextField1 = constructor.getTextField(CGRect(origin: CGPoint(x: 10, y: view.bounds.size.height - 70), size: CGSize(width: 50, height: 50)), tag: 1, color: UIColor.redColor())
        inputTextField1.delegate = self
        scrollView?.addSubview(inputTextField1)
        
        inputTextField2 = constructor.getTextField(CGRect(origin: CGPoint(x: view.bounds.size.width - 60, y: view.bounds.size.height - 70), size: CGSize(width: 50, height: 50)), tag: 2, color: UIColor.whiteColor())
        inputTextField2.delegate = self
        scrollView?.addSubview(inputTextField2)
        
        let setScoreButton = constructor.getButton(CGRect(origin: CGPoint(x: view.bounds.size.width * 0.5 - 120 * 0.5, y: view.bounds.size.height - 50  - 20), size: CGSize(width:120, height:50)), title: "Set score", color: UIColor.greenColor())
        setScoreButton.addTarget(self, action: #selector(ViewController.sendData), forControlEvents: UIControlEvents.TouchUpInside)
        scrollView?.addSubview(setScoreButton)
        
        tapRecognize = UITapGestureRecognizer()
        tapRecognize!.addTarget(self, action: #selector(ViewController.didTapView))
        view.addGestureRecognizer(tapRecognize!)
        
        view.backgroundColor = UIColor.blueColor() // Background color.
    }
    
    func didTapView(){view.endEditing(true)}
    
    func segmentChanged(paramSender: UISegmentedControl){
        resetScore() // Reset score.
        switch paramSender.selectedSegmentIndex {
        case 0:
            handleDraw(.Football, height: UIScreen.mainScreen().bounds.width * 0.4175 + 30)
        case 1:
            handleDraw(.Basketball, height: UIScreen.mainScreen().bounds.width * 0.42 + 30)
        case 2:
            handleDraw(.Tennis, height: UIScreen.mainScreen().bounds.width * 0.5)
        default:
            break
        }
    }

    func handleDraw(_type: SportTypes, height: CGFloat){
        if let _ = parentView {parentView!.removeFromSuperview()} // Remove old view.
        parentView = SportFieldView(sportType: _type, size: CGSize(width: 10, height: 10), frame: CGRect(x: 0, y: 100, width: UIScreen.mainScreen().bounds.width, height: height), margin: CGSize(width: 10, height: 10))
        parentView?.setDelegate(self)
        if let _ = parentView {scrollView?.addSubview(parentView!)}
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        storeScore(home: helperUtil.convertStringToNSNumber(inputTextField1.text), andAway: helperUtil.convertStringToNSNumber(inputTextField2.text))
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {scrollView?.setContentOffset(CGPoint(x: 0, y: 250), animated: true)}
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    func storeScore(home _home:NSNumber?, andAway _away:NSNumber?){
        if let _ = _home where homeCurrentScore.integerValue < _home!.integerValue {homeCurrentScore = _home!}
        if let _ = _away where awayCurrentScore.integerValue < _away?.integerValue {awayCurrentScore = _away!}
    }
    
    func resetScore(){
        homeCurrentScore = 0
        awayCurrentScore = 0
        inputTextField1.text = "\(0)"
        inputTextField2.text = "\(0)"
    }
    
    func sendData(){delegate?.setResultForHome(homeCurrentScore, andAway: awayCurrentScore)}
}