//
//  BookCell.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 24/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class BookCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var cellBackground: UIView! {
        didSet {
            cellBackground.layer.cornerRadius = 5
            cellBackground.backgroundColor = .white
        }
    }
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    override func awakeFromNib() {
        backgroundColor = .clear
    }
    
    func configureCell(with book: Book) {
        self.bookTitle.text = book.bookTitle
        self.bookAuthor.text = book.bookAuthor
    }
}
