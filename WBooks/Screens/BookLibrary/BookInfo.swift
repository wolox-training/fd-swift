//
//  BookInfo.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookInfo: NSObject {
    
    public static let sharedInstance = BookInfo()
    
    override init() {}
    
    func getAllBooks() -> [Book] {
        var array: [Book] = []
        
        let bookOne = Book(bookTitle: "First Book", bookAuthor: "Timothy Cross")
        array.append(bookOne)
        
        let bookTwo = Book(bookTitle: "Second Book", bookAuthor: "Sofi Oksanen")
        array.append(bookTwo)
        
        let bookThree = Book( bookTitle: "Third Book", bookAuthor: "Peter Sjernstrom")
        array.append(bookThree)
        
        let bookFour = Book(bookTitle: "Fourth Book", bookAuthor: "Tony Alcazar")
        array.append(bookFour)
        
        let bookFive = Book(bookTitle: "Fifth Book", bookAuthor: "Liliana Castilla")
        array.append(bookFive)
        
        return array
    }
    
}
