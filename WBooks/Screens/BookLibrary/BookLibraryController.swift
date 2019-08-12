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
    
    private let _view: BooksTableView = BooksTableView.loadFromNib()!
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable, message: "use init(viewModel:) instead")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    var bookLibraryModel: BookLibraryViewModel = {
        return BookLibraryViewModel()
    }()
    
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    
    var cellSelected: BookCell!
    var rectOfCellSelected: CGRect!
    
    override public func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLibraryTableViewModel()
        configureTableView()
        
        title = "LIBRARY".localized()
        
        let search = UIBarButtonItem.searchButton
        let notifications = UIBarButtonItem.notificationsButton
        navigationItem.rightBarButtonItems = [search]
        navigationItem.leftBarButtonItems = [notifications]
    }
    
    private func initLibraryTableViewModel() {
        bookLibraryModel.reloadViewClosure = { [weak self] () in
            DispatchQueue.main.async {
                self?._view.table.reloadData()
            }
        }
    bookLibraryModel.loadBooks()
    }
    
    private func configureTableView() {
        _view.table.delegate = self
        _view.table.dataSource = self
        _view.table.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        _view.table.register(cell: BookCell.self)
        _view.configureLibraryTableView()
    }
}

// MARK: - UITableViewDataSource
extension BookLibraryController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookLibraryModel.numberOfCellsBookLibrary
    }
    
    /*func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDetailsModel.numberOfCellsBookDetail
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: BookCell = tableView.dequeue(cell: BookCell.self)!
        let book = bookLibraryModel.getCellBookLibrary(at: indexPath)
        cell.configureCell(with: book, with: cell)
        return cell
    }
    
}

extension BookLibraryController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellSelected = tableView.cellForRow(at: indexPath) as? BookCell
        let rectOfCell = tableView.rectForRow(at: indexPath)
        rectOfCellSelected = tableView.convert(rectOfCell, to: tableView.superview)
        let book = bookLibraryModel.selectBook(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        let detailBookViewController = BookDetailFullViewController(with: book)
        navigationController?.pushViewController(detailBookViewController, animated: true)
    }
}
