//
//  Try.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/15/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation

enum Try<T> {
    case Error(Error)
    case Value(T)
    
    func map<U>(f: (T) -> U) -> Try<U> {
        switch self {
        case .Error(let error):
            return .Error(error)
        case .Value(let value):
            return .Value(f(value))
        }
    }
    
    func flatMap<U>(f: ((T) -> Try<U>)) -> Try<U> {
        switch self {
        case .Error(let error):
            return .Error(error)
        case .Value(let value):
            return f(value)
        }
    }
}
