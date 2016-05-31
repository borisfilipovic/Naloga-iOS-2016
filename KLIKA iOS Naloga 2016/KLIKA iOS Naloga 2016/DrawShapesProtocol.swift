//
//  DrawShapesProtocol.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

protocol DrawShapesProtocol {
    var height:CGFloat{get set}
    var width: CGFloat{get set}
    var rectWidth:CGFloat{get set}
    var rectHeight:CGFloat{get set}
    var marginX:CGFloat{get set}
    var marginY:CGFloat{get set}
    
    func getPath(forSportType selector:SportTypes)->CGPath
}
