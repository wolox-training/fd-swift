//
//  BookLibraryViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookLibraryViewModel {
    
    var bookLibraryModel: [Book] = [] {
        didSet {
            reloadViewClosure?()
        }
    }
    
    private var bookDetailsModel: [BookDetails] = [] {
        didSet {
            reloadViewClosure?()
        }
    }
    
    var numberOfCellsBookLibrary: Int {
        return bookLibraryModel.count
    }
    
    var numberOfCellsBookDetail: Int {
        return bookDetailsModel.count
    }
    
    var reloadViewClosure: (() -> Void)?
    
    func getCellBookLibrary(at indexPath: IndexPath) -> Book {
        return bookLibraryModel[indexPath.row]
    }
    
    func getCellBookDetail(at indexPath: IndexPath) -> BookDetails {
        return bookDetailsModel[indexPath.row]
    }
    
    func loadBooks() {
        let successBooks: ([Book]) -> Void = { (books) in
            self.bookLibraryModel = books
            self.bookDetailsModel = self.bookLibraryModel.map { BookDetails(book: $0) }
        }
        WBNetworkManager.manager.fetchBooks(onSuccess: successBooks, onError: { (error) in
            print(error)
        })
    }
    
    func selectBook(at indexPath: IndexPath) -> BookDetails {
        let book = bookDetailsModel[indexPath.row]
        return book
    }
    
}
