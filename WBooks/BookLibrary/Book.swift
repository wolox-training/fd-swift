//
//  Book.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

struct Book: Codable {
    
    var bookTitle: String?
    var bookAuthor: String?
    
    enum CodingKeys: String, CodingKey {
        case bookTitle
        case bookAuthor
    }
}
