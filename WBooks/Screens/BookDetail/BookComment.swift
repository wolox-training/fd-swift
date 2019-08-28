//
//  BookComment.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import Argo
import Curry
import Runes

struct BookComment {
    
    let id: Int
    let content: String
    let book: Book
    let user: BookUser
    
}

extension BookComment: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<BookComment> {
        return curry(BookComment.init)
            <^> json <| "id"
            <*> json <| "content"
            <*> json <| "book"
            <*> json <| "user"
    }
}
