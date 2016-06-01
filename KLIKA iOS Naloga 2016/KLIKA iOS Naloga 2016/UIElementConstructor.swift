//
//  UIElementConstructor.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 01/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

struct GUIConstructor {
    
    func getTextField(frame: CGRect, tag: Int, color: UIColor) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.tag = tag
        textField.textAlignment = .Center
        textField.keyboardType = .NumberPad
        textField.backgroundColor = color
        
        return textField
    }
    
//    func getGUI(size: CGSize) -> UIScrollView {
//        let scrollView = UIScrollView()
//    }
    
}
