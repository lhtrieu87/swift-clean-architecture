//
//  CDUser.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/16/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation
import CoreData

class CDUser: NSManagedObject {
    @NSManaged var id: Int32
    @NSManaged var name: String
    @NSManaged var email: String
}

