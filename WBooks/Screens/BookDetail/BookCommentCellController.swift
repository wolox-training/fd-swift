//
//  BookCommentCellController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 27/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Networking

import UIKit

class BookCommentCellController: UIViewController {
    
    let bookCommentCellView: BookCommentCellView = BookCommentCellView.loadFromNib()!
    private var bookDetailViewModel: BookDetailFullViewModel!
    private var bookDetailView: BookDetailFullView!
    
    convenience init(with bookDetailFullViewModel: BookDetailFullViewModel, with bookDetailFullView: BookDetailFullView) {
        self.init()
        bookDetailViewModel = bookDetailFullViewModel
        bookDetailView = bookDetailFullView
    }
    
    override func viewDidLoad() {
        
        configureTableView()
        
        initBookDetailTableViewModel()
    }
    
    private func initBookDetailTableViewModel() {
        
        bookDetailViewModel.reloadViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?.bookDetailView.detailTable.reloadData()
            }
        }
        
        bookDetailViewModel.loadComments(book: bookDetailViewModel.bookModel).startWithResult { [unowned self] result in
            switch result {
            case .success:
                self.bookDetailView.detailTable.reloadData()
            case .failure(let error):
                self.showAlertMessage(message: error.localizedDescription)
            }
        }
    }
    
    private func configureTableView() {
        bookDetailView.detailTable.delegate = self
        bookDetailView.detailTable.dataSource = self
        bookDetailView.configureDetailTableView()
        bookDetailView.detailTable.register(cell: BookCommentCellView.self)
    }
}

extension BookCommentCellController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension BookCommentCellController: UITableViewDataSource {
    
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
