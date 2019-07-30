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
    private let _view: TableView = TableView.loadFromNib()!
    @available(*, unavailable, message: "use init(viewModel:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var libraryItems: [Book] = []
    
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
        
    }
    
    private func configureTableView() {
        _view.table.delegate = self
        _view.table.dataSource = self
        _view.table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        let nib = UINib.init(nibName: "BookCell", bundle: nil)
        _view.table.register(nib, forCellReuseIdentifier: "BookCell")
        
        _view.table.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
        _view.table.separatorStyle = .none
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
        
        let cell: BookCell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as! BookCell // swiftlint:disable:this force_cast
        
        let book: Book = libraryItems[indexPath.row]
        
        cell.bookTitle.text = book.bookTitle
        cell.bookAuthor.text = book.bookAuthor
        
        return cell
    }
    
}

extension BookLibraryController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
