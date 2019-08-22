//
//  BookRent.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 05/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import Argo
import Curry
import Runes

struct BookRent {
    
    let id: Int
    let from: String
    let to: String
    let bookID: Int
    let userID: Int
}

extension BookRent: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<BookRent> {
        return curry(BookRent.init)
            <^> json <| "id"
            <*> json <| "from"
            <*> json <| "to"
            <*> json <| "bookID"
            <*> json <| "userID"
    }
}
