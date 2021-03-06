//
//  Book.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import Argo
import Curry
import Runes

enum BookStatus: String, CaseIterable {
    case rented
    case inYourHands
    case available
    case unknown
    
    func bookStatusText() -> String {
        switch self {
        case .available:
            return "AVAILABLE".localized()
        default:
            return "UNAVAILABLE".localized()
        }
    }
    
    func isBookAvailable() -> Bool {
        return self == .available
    }
    
}

struct Book {
    
    let id: Int
    let title: String
    let author: String
    let genre: String
    let status: String
    let year: String
    let image: String
    var bookStatus: BookStatus {
        return BookStatus(rawValue: status) ?? .unknown
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case genre
        case status
        case year
        case image
    }
}

extension Book: Argo.Decodable {
    
    static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
            <^> json <| "id"
            <*> json <| "title"
            <*> json <| "author"
            <*> json <| "status"
            <*> json <| "genre"
            <*> json <| "year"
            <*> json <| "image"
    }
}
