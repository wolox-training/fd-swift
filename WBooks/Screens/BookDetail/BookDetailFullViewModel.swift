//
//  BookDetailFullViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Networking

import UIKit

class BookDetailFullViewModel {
    
    private var commentsViewModels: MutableProperty<[BookComment]> = MutableProperty([])
    
    let bookModel: Book!
    
    let repository =  WBNetworkManager(configuration: networkingConfiguration, defaultHeaders: WBNetworkManager.commonHeaders())
    
    init(with book: Book) {
        bookModel = book
    }
    
    var numberOfCells: Int {
        return commentsViewModels.value.count
    }
    
    var reloadViewClosure: (() -> Void)?

    func getCellBookDetail(at indexPath: IndexPath) -> BookComment {
        return commentsViewModels.value[indexPath.row]
    }
    
    func loadComments(book: Book) -> SignalProducer<[BookComment], RepositoryError> {
        return self.repository.getBookComments(book: book ).on(failed: { [unowned self] _ in self.commentsViewModels.value = [] }, value: { [unowned self] value in self.commentsViewModels.value = value })
    }
    
    func rentBook(book: Book) -> SignalProducer<Void, RepositoryError> {
        return repository.rentBook(book: book)
    }
}
