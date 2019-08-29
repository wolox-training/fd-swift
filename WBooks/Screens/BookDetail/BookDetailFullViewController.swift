//
//  BookDetailFullViewController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

import ReactiveCocoa
import ReactiveSwift
import Networking

class BookDetailFullViewController: UIViewController {
    
    let bookDetailFullView: BookDetailFullView = BookDetailFullView.loadFromNib()!
    private let _detailHeaderView: BookDetailView = BookDetailView.loadFromNib()!
    private var bookDetailViewModel: BookDetailFullViewModel!
    private var commentViewController: BookCommentCellController!
    
    convenience init(with bookDetailFullViewModel: BookDetailFullViewModel) {
        self.init()
        bookDetailViewModel = bookDetailFullViewModel
        self.commentViewController = BookCommentCellController(with: bookDetailFullViewModel, with: bookDetailFullView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "BOOK_DETAIL".localized()
        
        _detailHeaderView.bindRent()
        
        let backButtonItem = UIBarButtonItem.backButton(action: self.backButtonPressed)
        navigationItem.leftBarButtonItems = [backButtonItem]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _detailHeaderView.setup(with: bookDetailViewModel.bookModel)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    override func loadView() {
        bookDetailFullView.detailHeaderView.addSubview(_detailHeaderView)
        bookDetailFullView.detailTable.addSubview(commentViewController.view)
        view = bookDetailFullView
    }
}

// MARK: - DetailBookDelegate
extension BookDetailFullViewController: DetailBookDelegate {
    
    func rentBook() {
        guard bookDetailViewModel.bookModel.bookStatus == .available else {
            showAlertMessage(message: "RENT_UNAVAILABLE".localized(withArguments: bookDetailViewModel.bookModel.bookStatus.bookStatusText()))
            return
        }
        bookDetailViewModel.rentBook(book: bookDetailViewModel.bookModel).startWithResult { [unowned self] result in
            switch result {
            case .success:
                self.bookDetailFullView.detailTable.reloadData()
            case .failure(let error):
                self.showAlertMessage(message: error.localizedDescription)
            }
        }
    }
}
