//
//  DrawShapesProtocol.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 30/05/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

protocol DrawShapesProtocol {
    var sportType: SportTypes? {get set}
    var size: CGSize? {get set} // height, width
    var rect: CGSize? {get set} // rectHeight, rectWidth
    var margin: CGSize? {get set} // marginX marginY
    
    init(sportType:SportTypes, size: CGSize, frame: CGRect, margin: CGSize)
    func getPath(forSportType selector:SportTypes, andContext context:CGContext)->CGContext
}
