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
    var size: CGSize? {get set}
    var rect: CGSize? {get set}
    var margin: CGSize? {get set}
    var homeCurrentScore:NSNumber? {get set}
    var awayCurrentScore:NSNumber? {get set}
    var homeOldScore:NSNumber? {get set}
    var awayOldScore:NSNumber? {get set}

    init(sportType:SportTypes, size: CGSize, frame: CGRect, margin: CGSize)
    func getPath(forSportType selector:SportTypes, andContext context:CGContext)->CGContext
}
