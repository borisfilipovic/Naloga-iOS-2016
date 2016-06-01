//
//  SportTypeDatasourceProtocol.swift
//  KLIKA iOS Naloga 2016
//
//  Created by Boris Filipovic on 01/06/16.
//  Copyright © 2016 Boris Filipovic. All rights reserved.
//

import UIKit

protocol SportTypeDatasourceProtocol {
    func getDrawFieldDataContext(context:CGContext,frame:CGSize) -> CGContext
}
