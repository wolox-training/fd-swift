//
//  BookDetailViewController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 30/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import UIKit
import WolmoCore

class BookDetailViewController: UIViewController {
    
    let bookDetailView: BookDetailView = BookDetailView.loadFromNib()!
    private var bookDetailViewModel: BookDetailFullViewModel!
    
    convenience init(with bookDetailFullViewModel: BookDetailFullViewModel) {
        self.init()
        bookDetailViewModel = bookDetailFullViewModel
    }
    
    override func loadView() {
        view = bookDetailView
    }
    
    override func viewDidLoad() {
        bookDetailView.bindRent()
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        bookDetailView.setup(with: bookDetailViewModel.bookModel)
    }
}
