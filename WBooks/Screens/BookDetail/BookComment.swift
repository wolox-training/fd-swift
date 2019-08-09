//
//  BookComment.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

struct BookComment: Codable {
    
    let id: Int
    let content: String
    let book: Book
    let user: BookUser
    
    enum CodingKeys: String, CodingKey {
        case id
        case content
        case book
        case user
    }
}
