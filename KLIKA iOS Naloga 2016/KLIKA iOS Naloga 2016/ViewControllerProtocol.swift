//
//  ViewControllerProtocol.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 01/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

protocol ViewControllerProtocol {
    var inputTextField1:UITextField {get set}
    var inputTextField2:UITextField {get set}
    var segmentedControll:UISegmentedControl? {get set}
    var delegate:MatchPitchProtocol? {get set}
    var homeCurrentScore:NSNumber {get set}
    var awayCurrentScore:NSNumber {get set}
    
    func handleDraw(_type: SportTypes, height: CGFloat)
    func sendData()
}
