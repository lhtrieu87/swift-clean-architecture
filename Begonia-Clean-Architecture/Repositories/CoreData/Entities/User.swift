//
//  User.swift
//  Begonia-Clean-Architecture
//
//  Created by Le Hong Trieu on 7/16/17.
//  Copyright © 2017 Le Hong Trieu. All rights reserved.
//

import Foundation

struct User {
    let id: Int32
    let name: String
    let email: String
}

class UserParser: Parser {
    func parse(_ from: CDUser) -> User {
        return User(id: from.id, name: from.name, email: from.email)
    }
}
