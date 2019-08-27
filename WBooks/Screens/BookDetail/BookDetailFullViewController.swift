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
    private let _detailHeaderView: BookDetailView = BookDetailView.loadFromNib()!
    private var bookDetailViewModel: BookDetailFullViewModel!
    
    convenience init(with bookDetailFullViewModel: BookDetailFullViewModel) {
        self.init()
        bookDetailViewModel = bookDetailFullViewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "BOOK_DETAIL".localized()
        
        configureTableView()
        
        initBookDetailTableViewModel()
        
        _detailHeaderView.bindRent()
        
        let backButtonItem = UIBarButtonItem.backButton(for: self)
        navigationItem.leftBarButtonItems = [backButtonItem]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _detailHeaderView.setup(with: bookDetailViewModel.bookModel)
    }
    
    override func loadView() {
        _view.detailHeaderView.addSubview(_detailHeaderView)
        view = _view
    }
    
    // MARK: - Private
    private func initBookDetailTableViewModel() {
        
        bookDetailViewModel.reloadViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?._view.detailTable.reloadData()
            }
        }
        
        bookDetailViewModel.loadComments(book: bookDetailViewModel.bookModel).startWithResult { [unowned self] result in
            switch result {
            case .success:
                self._view.detailTable.reloadData()
            case .failure(let error):
                self.showAlertMessage(message: error.localizedDescription)
            }
        }
    }

    private func configureTableView() {
        _view.detailTable.delegate = self
        _view.detailTable.dataSource = self
        _view.configureDetailTableView()
        _view.detailTable.register(cell: BookCommentCellView.self)
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
        
        let cell: BookCommentCellView = tableView.dequeue(cell: BookCommentCellView.self)!
        
        let comment = bookDetailViewModel.getCellBookDetail(at: indexPath)
        cell.commentViewModel = comment
        
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
    
    func rentBook() {
        guard bookDetailViewModel.bookModel.bookStatus == .available else {
            showAlertMessage(message: "RENT_UNAVAILABLE".localized(withArguments: bookDetailViewModel.bookModel.bookStatus.bookStatusText()))
            return
        }
        bookDetailViewModel.rentBook(book: bookDetailViewModel.bookModel).startWithResult { [unowned self] result in
            switch result {
            case .success:
                self._view.detailTable.reloadData()
            case .failure(let error):
                self.showAlertMessage(message: error.localizedDescription)
            }
        }
    }
}
