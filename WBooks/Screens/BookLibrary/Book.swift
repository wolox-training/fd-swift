//
//  Book.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

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

struct Book: Codable {
    
    let id: Int
    let title: String
    let author: String
    let genre: String
    let status: String
    let year: String
    let image: String
    
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

struct BookDetails {
    
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var bookId: String {
        return String(book.id)
    }
    
    var bookTitle: String {
        return book.title
    }
    
    var bookAuthor: String {
        return book.author
    }
    
    var bookStatus: BookStatus {
        return BookStatus(rawValue: book.status) ?? .unknown
    }
    
    var bookGenre: String {
        return book.genre
    }
    
    var bookYear: String {
        return book.year
    }
    
    var bookImageURL: String {
        return book.image
    }
    
}
