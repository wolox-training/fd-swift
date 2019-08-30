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

    private var bookLibraryViewModel: MutableProperty<[Book]> = MutableProperty([])
    
    var numberOfCellsBookLibrary: Int {
        return bookLibraryViewModel.value.count
    }
    
    let repository = WBNetworkManager(configuration: networkingConfiguration, defaultHeaders: WBNetworkManager.commonHeaders())
    
    func getCellBookLibrary(at indexPath: IndexPath) -> Book {
        return bookLibraryViewModel.value[indexPath.row]
    }
    
    func loadBooks() -> SignalProducer<[Book], RepositoryError> {
        return self.repository.fetchBooks().on(failed: { [unowned self] _ in self.bookLibraryViewModel.value = [] }, value: { [unowned self] value in
            self.bookLibraryViewModel.value = value
        })
    }
    
    func selectBook(at indexPath: IndexPath) -> Book {
        let book = bookLibraryViewModel.value[indexPath.row]
        return book
    }
    
    func bindBooks(with bookLibraryController: BookLibraryController) {
        self.loadBooks().startWithResult { [unowned bookLibraryController] result in
            switch result {
            case .success:
                bookLibraryController.bookTableView.table.reloadData()
            case .failure(let error):
                bookLibraryController.showAlertMessage(message: error.localizedDescription)
            }
        }
    }
}
