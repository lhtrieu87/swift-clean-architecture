//
//  CDTimeline+Parser.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/16/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation
import CoreData

struct Location {
    let name: String
}

class CDTimeline: NSManagedObject {
    @NSManaged var id: Int32
    
    @NSManaged private var locationName: String?
    var location: Location {
        get {
            return Location(name: self.locationName ?? "")
        }
        set {
            self.locationName = newValue.name
        }
    }
    
    @NSManaged var subtype: String
    @NSManaged var timestamp: Date
    @NSManaged var totalMessages: Int16
    @NSManaged var wasDeleted: Bool
}
