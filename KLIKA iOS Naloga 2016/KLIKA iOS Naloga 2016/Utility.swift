//
//  Utility.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 01/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import Foundation

enum SportTypes {
    case Football
    case Basketball
    case Tennis
}

struct HelperMethods {
    
    func convertStringToNSNumber(_string: String?) -> NSNumber? {
        if let _ = _string where !_string!.isEmpty {
            return NSNumber(integer: Int(_string!)!)
        }
        return nil
    }
}