//
//  BookDetailFullViewController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class BookDetailFullViewController: UIViewController {
    
    private let _view: BookDetailFullView = BookDetailFullView.loadFromNib()!
    private let _detailHeaderView: BookDetail = BookDetail.loadFromNib()!
    
    lazy var bookDetailViewModel: BookDetailFullViewModel = {
        return BookDetailFullViewModel()
    }()
    
    var bookViewModel: BookDetails!
    
    convenience init(with bookViewModel: BookDetails) {
        self.init()
        self.bookViewModel = bookViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "BOOK_DETAIL".localized()
        
        configureTableView()
        
        initBookDetailTableViewModel()
    }
    
    override func loadView() {
        _detailHeaderView.setup(with: bookViewModel)
        _detailHeaderView.delegate = self
        _view.detailHeaderView.addSubview(_detailHeaderView)
        view = _view
    }
    
    // MARK: - Private
    private func initBookDetailTableViewModel() {
        
        bookDetailViewModel.showErrorAlertClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                self?.showAlertMessage(message: error.localizedDescription)
            }
        }
        
        bookDetailViewModel.showAlertClosure = { [weak self] (message) in
            DispatchQueue.main.async {
                self?.showAlertMessage(message: message)
            }
        }
        
        bookDetailViewModel.reloadViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?._view.detailTable.reloadData()
            }
        }
        
        bookDetailViewModel.loadComments(for: bookViewModel)
    }
    
    private func configureTableView() {
        _view.detailTable.delegate = self
        _view.detailTable.dataSource = self
        _view.configureDetailTableView()
    }
}

// MARK: - UITableViewDataSource
extension BookDetailFullViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDetailViewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCommentCell", for: indexPath) as? BookCommentCell else {
            fatalError("Cell not exists")
        }
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate
extension BookDetailFullViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - DetailBookDelegate
extension BookDetailFullViewController: DetailBookDelegate {
    func addToWishlist() {
    }
    
    func rentBook() {
        guard bookViewModel.bookStatus == .available else {
            showAlertMessage(message: "RENT_UNAVAILABLE".localized(withArguments: bookViewModel.bookStatus.bookStatusText()))
            return
        }
        bookDetailViewModel.rentBook(book: bookViewModel)
    }
}
