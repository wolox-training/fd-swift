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
    var libraryItems: [Book] = []
    private let _view: BooksTableView = BooksTableView.loadFromNib()!
    @available(*, unavailable, message: "use init(viewModel:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        libraryItems = BookInfo.sharedInstance.getAllBooks()
        
        title = "LIBRARY".localized()
        
        let search = UIBarButtonItem(image: UIImage(named: "SearchIcon"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        let notifications = UIBarButtonItem(image: UIImage(named: "Notifications"), style: UIBarButtonItem.Style.plain, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [search]
        navigationItem.leftBarButtonItems = [notifications]
    }
    
    private func configureTableView() {
        _view.table.delegate = self
        _view.table.dataSource = self
        _view.table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        _view.table.register(cell: BookCell.self)
    }
    
}

// MARK: - UITableViewDataSource
extension BookLibraryController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return libraryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: BookCell = tableView.dequeue(cell: BookCell.self)!
        
        let book: Book = libraryItems[indexPath.row]
        
        cell.configureCell(with: book)
        
        return cell
    }
    
}

extension BookLibraryController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
