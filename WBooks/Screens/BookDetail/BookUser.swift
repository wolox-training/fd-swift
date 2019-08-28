//
//  BookUser.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 09/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Argo
import Curry
import Runes

struct BookUser {
    
    let id: Int
    let username: String
    let imageURL: String
}

extension BookUser: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<BookUser> {
        return curry(BookUser.init)
            <^> json <| "id"
            <*> json <| "username"
            <*> json <| "image"
    }
}
