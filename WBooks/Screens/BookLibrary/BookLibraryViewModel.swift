//
//  BookLibraryViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookLibraryViewModel {
    
    private var bookDetailsModel: [Book] = [] {
        didSet {
            reloadViewClosure?()
        }
    }
    
    var numberOfCellsBookLibrary: Int {
        return bookDetailsModel.count
    }
    
    var reloadViewClosure: (() -> Void)?
    
    func getCellBookLibrary(at indexPath: IndexPath) -> Book {
        return bookDetailsModel[indexPath.row]
    }
    
    func loadBooks() {
        let successBooks: ([Book]) -> Void = { (books) in
            self.bookDetailsModel = books
        }
        WBNetworkManager.manager.fetchBooks(onSuccess: successBooks, onError: { (error) in
            print(error)
        })
    }
    
    func selectBook(at indexPath: IndexPath) -> Book {
        let book = bookDetailsModel[indexPath.row]
        return book
    }
    
}
