//
//  BookLibraryViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookLibraryViewModel {
    
    private var bookLibraryViewModel: [Book] = [] {
        didSet {
            reloadViewClosure?()
        }
    }
    
    var numberOfCellsBookLibrary: Int {
        return bookLibraryViewModel.count
    }
    
    var reloadViewClosure: (() -> Void)?
    
    func getCellBookLibrary(at indexPath: IndexPath) -> Book {
        return bookLibraryViewModel[indexPath.row]
    }
    
    func loadBooks() {
        let successBooks: ([Book]) -> Void = { (books) in
            self.bookLibraryViewModel = books
        }
        WBNetworkManager.manager.fetchBooks(onSuccess: successBooks, onError: { (error) in
            print(error)
        })
    }
    
    func selectBook(at indexPath: IndexPath) -> Book {
        let book = bookLibraryViewModel[indexPath.row]
        return book
    }
    
}
