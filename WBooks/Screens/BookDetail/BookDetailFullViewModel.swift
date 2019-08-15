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
    
    private var commentsViewModels: [BookComment] = [] {
        didSet {
            reloadViewClosure?()
        }
    }
    
    var numberOfCells: Int {
        return commentsViewModels.count
    }
    
    var reloadViewClosure: (() -> Void)?
    var showErrorAlertClosure: ((Error) -> Void)?
    var showAlertClosure: ((String) -> Void)?
    
    func getCellBookDetail(at indexPath: IndexPath) -> BookComment {
        return commentsViewModels[indexPath.row]
    }
    
    func loadComments(for bookView: Book, onErrorComments: @escaping (Error) -> Void) {
        
        let successComments: ([BookComment]) -> Void = { (comments) in
            self.commentsViewModels = comments
        }
        
        WBNetworkManager.manager.getBookComments(book: bookView, onSuccess: successComments, onError: onErrorComments)
    }
    
    func rentBook(book: Book) {
        
        let successRent: (BookRent) -> Void = { (rent) in
            self.showAlertClosure?("BOOK_RESERVED".localized())
        }
        
        let failureRent: (Error) -> Void = { (error) in
            self.showErrorAlertClosure?(error)
        }
        
        WBNetworkManager.manager.rentBook(book: book, onSuccess: successRent, onError: failureRent)
    }
}
