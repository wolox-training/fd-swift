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
        
        let backButton = UIBarButtonItem.backButton(for: self, action: #selector(backButtonPressed))
        navigationItem.leftBarButtonItems = [backButton]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        _detailHeaderView.setup(with: bookViewModel)
    }
    
    @objc func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    override func loadView() {
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
        let commentBookNib = UINib.init(nibName: "BookCommentCellView", bundle: nil)
        _view.detailTable.register(commentBookNib, forCellReuseIdentifier: "BookCommentCellView")
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
