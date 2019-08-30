//
//  AddNewViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 23/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import ReactiveCocoa
import ReactiveSwift
import Networking

 class AddNewViewModel: NSObject {
 
 let repository: WBNetworkManager
 
 lazy var addBook = Action<(Book), Book, RepositoryError> { [unowned self] book in
 
 if book.title == "" || book.author == "" || book.genre == "" || book.year == "" {
        print(book)
        return SignalProducer(error: RepositoryError.invalidURL)
    }
    
    return self.addBook(book: book)
 }
 
 init(booksRepository: WBNetworkManager) {
    repository = booksRepository
 }
 
 // MARK: - Repository
 func addBook(book: Book) -> SignalProducer<Book, RepositoryError> {
 //WBBooksManager.sharedIntance.needsReload.value = true
    return repository.addBook(book: book)
    }
 }
