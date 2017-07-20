//
//  Repository.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/14/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation
import RxSwift

protocol Repository {
    associatedtype S
    
    func get<P: Parser>(predicate: NSPredicate, sorts: [NSSortDescriptor], parser: P) -> Observable<Try<[P.T]>> where P.F == S
}

protocol Parser {
    associatedtype F
    associatedtype T
    func parse(_ from: F) -> T
}
