//
//  BookLibraryViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Networking

class BookLibraryViewModel {
    
    private var bookDetailsModel: MutableProperty<[Book]> = MutableProperty([])
    
    var numberOfCellsBookLibrary: Int {
        return bookDetailsModel.value.count
    }
    
    let repository: WBNetworkManager
    
    init(bookRepository: WBNetworkManager) {
        repository = bookRepository
    }
    
    func getCellBookLibrary(at indexPath: IndexPath) -> Book {
        return bookDetailsModel.value[indexPath.row]
    }
    
    func loadBooks() -> SignalProducer<[Book], RepositoryError> {
        return self.repository.fetchBooks().on(failed: { [unowned self] _ in self.bookDetailsModel.value = [] }, value: { [unowned self] value in
            self.bookDetailsModel = MutableProperty(value.map { Book(book: $0) })
            //self.sortBooks(by: .id)
        })
    }
    
    func selectBook(at indexPath: IndexPath) -> Book {
        let book = bookDetailsModel.value[indexPath.row]
        return book
    }
    
}
