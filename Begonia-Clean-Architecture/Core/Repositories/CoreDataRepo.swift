//
//  CoreDataRepo.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/15/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation
import RxSwift
import CoreData

class CoreDataRepo: Repository {
    typealias S = NSManagedObject
    
    let dbContext: NSManagedObjectContext
    
    init(dbContext: NSManagedObjectContext) {
        self.dbContext = dbContext
    }
    
    func get<P>(predicate: NSPredicate, sorts: [NSSortDescriptor], parser: P) -> Observable<Try<[P.T]>> where P : Parsable, P.F : CoreDataRepo.S {
        let request = NSFetchRequest<P.F>(entityName: P.F.description())
        request.predicate = predicate
        request.sortDescriptors = sorts
        
        return Observable.just(request)
            .flatMap { request -> Observable<P.F> in
                let repoObjs = try self.dbContext.fetch(request)
                return Observable.from(repoObjs)
            }
            .map({ repoObj -> P.T in
                return parser.parse(repoObj)
            })
            .toArray()
            .map({ parsedObjs -> Try<[P.T]> in
                return Try.Value(parsedObjs)
            })
            .catchError({ error -> Observable<Try<[P.T]>> in
                return Observable.just(Try.Error(error))
            })
    }
}
