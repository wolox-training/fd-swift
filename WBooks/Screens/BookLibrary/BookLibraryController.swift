//
//  BookTableController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class BookLibraryController: UIViewController {
    
    let bookTableView: BooksTableView = BooksTableView.loadFromNib()!
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    let bookLibraryViewModel = BookLibraryViewModel()
    
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = bookTableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        title = "LIBRARY".localized()
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem.searchButton]
        navigationItem.leftBarButtonItems = [UIBarButtonItem.notificationsButton]
        
        bookLibraryViewModel.bindBooks(with: self)
    }
    
    private func configureTableView() {
        bookTableView.table.delegate = self
        bookTableView.table.dataSource = self
        bookTableView.table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        bookTableView.table.register(cell: BookCell.self)
        bookTableView.configureLibraryTableView()
    }
}

// MARK: - UITableViewDataSource
extension BookLibraryController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookLibraryViewModel.numberOfCellsBookLibrary
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: BookCell = tableView.dequeue(cell: BookCell.self)!
        let book = bookLibraryViewModel.getCellBookLibrary(at: indexPath)
        cell.configureCell(with: book, with: cell)
        return cell
    }
    
}

extension BookLibraryController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let book = bookLibraryViewModel.selectBook(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let viewModel = BookDetailFullViewModel(with: book)
        let detailBookViewController = BookDetailFullViewController(with: viewModel)
        navigationController?.pushViewController(detailBookViewController, animated: true)
    }
}
