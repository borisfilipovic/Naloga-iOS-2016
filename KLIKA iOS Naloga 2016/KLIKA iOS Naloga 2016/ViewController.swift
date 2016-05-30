//
//  ViewController.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 27/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

enum SportTypes {
    case Football
    case Basketball
    case Tennis
}

class ViewController: UIViewController, UITextFieldDelegate{
    
    var activeField: UITextField?
    
    // Sport types.
    var footballVC:FootballCV?
    var basketballVC:BasketballVC?
    var tennisVC:TennisVC?

    //var sportTypeVC:UIViewController?
    //var drawView:UIView?
    var parentView:UIView?
    var scrollView:UIScrollView?
    var segmentedControll:UISegmentedControl?
    var scoreLabel = UILabel()
    
    // Text fields.
    var inputTextField1 = UITextField()
    var inputTextField2 = UITextField()
    
    // Gesture recognizer.
    var tapRecognize:UITapGestureRecognizer?
    
    // Score variables.
    var homeCurrentScore:NSNumber = 0
    var awayCurrentScore:NSNumber = 0
    
    // Protocol delegate.
    var delegate:MatchPitchProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial setup.
        createScrollView() // Create scroll view.
        createSegmentedControll() // Create segmented controlls.
        createTextFields() // Create text fields.
        createGestureRecognizer() // Create gesture recognizer.
        handleDraw(SportTypes.Football) // Draw initial field.
        view.backgroundColor = UIColor.blueColor() // Background color.
    }
    
    func createScrollView(){
        scrollView = UIScrollView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: view.bounds.size))
        view.addSubview(scrollView!)
    }
    
    func createSegmentedControll(){
        let segmentedControllElements = ["Football", "Basketball", "Tennis"]
        segmentedControll = UISegmentedControl(items: segmentedControllElements)
        segmentedControll?.center = CGPoint(x: UIScreen.mainScreen().bounds.width * 0.5, y: 60)
        segmentedControll?.selectedSegmentIndex = 0
        segmentedControll?.addTarget(self, action: #selector(ViewController.segmentChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        scrollView?.addSubview(segmentedControll!)
    }
    
    func createTextFields(){
        // 3. Create UITextField.
        let textFieldSize = CGSize(width: 50, height: 50)
        let setScoreButtonSize = CGSize(width: 120, height: 50)
        let marginX:CGFloat = 10
        
        // 4.Left input text field.
        inputTextField1 = UITextField(frame: CGRect(origin: CGPoint(x: marginX, y: view.bounds.size.height - textFieldSize.height  - 20), size: CGSize(width: textFieldSize.width, height: textFieldSize.height)))
        inputTextField1.tag = 1
        inputTextField1.delegate = self
        inputTextField1.textAlignment = .Center
        inputTextField1.keyboardType = .NumberPad
        inputTextField1.backgroundColor = UIColor.redColor()
        scrollView?.addSubview(inputTextField1)
        
        // 5. Right input text field.
        inputTextField2 = UITextField(frame: CGRect(origin: CGPoint(x: view.bounds.size.width - textFieldSize.width - marginX, y: view.bounds.size.height - textFieldSize.height - 20), size: CGSize(width: textFieldSize.width, height: textFieldSize.height)))
        inputTextField2.tag = 2
        inputTextField2.delegate = self
        inputTextField2.textAlignment = .Center
        inputTextField2.keyboardType = .NumberPad
        inputTextField2.backgroundColor = UIColor.whiteColor()
        scrollView?.addSubview(inputTextField2)
        
        // 6. Set score button.
        let setScoreButton = UIButton(frame: CGRect(origin: CGPoint(x: view.bounds.size.width * 0.5 - setScoreButtonSize.width * 0.5, y: view.bounds.size.height - setScoreButtonSize.height  - 20), size: CGSize(width: setScoreButtonSize.width, height: setScoreButtonSize.height)))
        setScoreButton.setTitle("Set score", forState: .Normal)
        setScoreButton.backgroundColor = UIColor.greenColor()
        setScoreButton.addTarget(self, action: #selector(ViewController.sendData), forControlEvents: UIControlEvents.TouchUpInside)
        scrollView?.addSubview(setScoreButton)
    }
    
    func createGestureRecognizer(){
        tapRecognize = UITapGestureRecognizer()
        tapRecognize!.addTarget(self, action: #selector(ViewController.didTapView))
        view.addGestureRecognizer(tapRecognize!)
    }
    
    func didTapView(){view.endEditing(true)}
    
    func segmentChanged(paramSender: UISegmentedControl){
        switch paramSender.selectedSegmentIndex {
        case 0:
            handleDraw(.Football)
        case 1:
            handleDraw(.Basketball)
        case 2:
            handleDraw(.Tennis)
        default:
            print("Segmented controll button sent unknow value")
            break
        }
    }

    func handleDraw(_type: SportTypes){
        if let _ = parentView {
            parentView!.removeFromSuperview() // Remove old view.
            parentView = nil
        }
        
        resetScore()
        
        switch _type {
        case .Basketball:
            basketballVC = BasketballVC()
            basketballVC?.configureViewController(self)
            parentView = basketballVC?.initUIView(frame: CGRect(x: 0, y: 100, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.width * 0.42 + 30))
        case .Football:
            footballVC = FootballCV()
            footballVC?.configureViewController(self)
            parentView = footballVC?.initUIView(frame: CGRect(x: 0, y: 100, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.width * 0.4175 + 30))
        case .Tennis:
            tennisVC = TennisVC()
            tennisVC?.configureViewController(self)
            parentView = tennisVC?.initUIView(frame: CGRect(x: 0, y: 100, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.width * 0.5))
        }
        
        //if let _ = parentView {view.addSubview(parentView!)}
        if let _ = parentView {scrollView?.addSubview(parentView!)}
    }
    
    // MARK: - UITextField delegate function.
    func textFieldDidEndEditing(textField: UITextField) {
        scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)        
        if textField.tag == 1 {
            storeScore(home: convertStringToNSNumber(inputTextField1.text), andAway: nil)
        } else if textField.tag == 2 {
            storeScore(home: nil, andAway: convertStringToNSNumber(inputTextField2.text))
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        scrollView?.setContentOffset(CGPoint(x: 0, y: 250), animated: true)
    }
    
    // MARK: - Handle and store score.
    func storeScore(home _home:NSNumber?, andAway _away:NSNumber?){
        if let _ = _home where homeCurrentScore.integerValue < _home!.integerValue {homeCurrentScore = _home!}
        if let _ = _away where awayCurrentScore.integerValue < _away?.integerValue {awayCurrentScore = _away!}
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let invalidCharacters = NSCharacterSet(charactersInString: "0123456789").invertedSet
        return string.rangeOfCharacterFromSet(invalidCharacters, options: [], range: string.startIndex ..< string.endIndex) == nil
    }
    
    // MARK: - Reset score.
    func resetScore(){
        homeCurrentScore = 0
        awayCurrentScore = 0
        inputTextField1.text = "\(0)"
        inputTextField2.text = "\(0)"
    }
    
    // MARK: - Send data.
    func sendData(){delegate?.setResultForHome(homeCurrentScore, andAway: awayCurrentScore)}
    
    // MARK: - Convert String to NSNumber.
    func convertStringToNSNumber(_string: String?) -> NSNumber? {
        if let _ = _string where !_string!.isEmpty {
            return NSNumber(integer: Int(_string!)!)
        }
        
        return nil
    }
}