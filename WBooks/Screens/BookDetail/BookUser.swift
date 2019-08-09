//
//  BookUser.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 09/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit

struct BookUser: Codable {
    
    let id: Int
    let username: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case imageURL = "image"
    }
}
