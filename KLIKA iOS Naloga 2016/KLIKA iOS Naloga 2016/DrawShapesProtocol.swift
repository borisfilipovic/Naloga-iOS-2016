//
//  DrawShapesProtocol.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

protocol DrawShapesProtocol {
    var paths:[CGPath]? {get set}
    mutating func generatePath(fromPoints points:[String:[CGPoint]], andCircleFrom params:[Bool:[CGFloat]])-> [CGPath]?
}
