//
//  BookLibraryViewModel.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookLibraryViewModel {
    
    var libraryItems: [Book] = [] {
        didSet {
            self.reloadViewClosure?()
        }
    }
    
    var numberOfCells: Int {
        return libraryItems.count
    }
    
    var heightOfCells: CGFloat {
        return 105
    }
    
    var reloadViewClosure: (() -> Void)?
    
    func getCellViewModel(at indexPath: IndexPath) -> Book {
        return libraryItems[indexPath.row]
    }
    
    func loadBooks() {
        WBNetworkManager.manager.fetchBooks(onSuccess: { (books) in
            self.libraryItems = books
        }, onError: { (error) in
            print(error)
        })
    }
    
}
