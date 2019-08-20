//
//  BookRent.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 05/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

struct BookRent: Codable {
    
    let id: Int
    let from: String
    let to: String
    let bookID: Int
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case from
        case to
        case bookID
        case userID
    }
}
