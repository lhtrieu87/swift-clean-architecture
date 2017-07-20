//
//  Timeline.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/16/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation

struct Timeline {
    let id: Int32
    let locationName: Location
    let subtype: String
    let timestamp: Date
    let totalMessages: Int16
    let wasDeleted: Bool
}
