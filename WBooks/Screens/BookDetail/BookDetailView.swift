//
//  BookDetailView.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 05/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

protocol DetailBookDelegate: class {
    func rentBook()
}

class BookDetailView: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAvaiability: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var wishlistButton: UIButton! {
        didSet {
            wishlistButton.layer.cornerRadius = 20
            wishlistButton.layer.borderWidth = 1
            wishlistButton.layer.borderColor = UIColor.blueBorder().cgColor
            wishlistButton.setTitleColor(.blueBorder(), for: .normal)
        }
    }
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.layer.cornerRadius = 20
            rentButton.layer.borderWidth = 1        }
    }
    @IBOutlet weak var bookImage: UIImageView!
    
    weak var delegate: DetailBookDelegate?
    
    func setup(with bookViewModel: BookDetails) {
        bookImage.loadImageUsingCache(withUrl: bookViewModel.bookImageURL)
        bookTitle.text = bookViewModel.bookTitle
        bookAuthor.text = bookViewModel.bookAuthor
        bookAvaiability.text = bookViewModel.bookStatus.bookStatusText()
        bookAuthor.text = bookViewModel.bookAuthor
        bookYear.text = bookViewModel.bookYear
        bookGenre.text = bookViewModel.bookGenre
        if bookViewModel.bookStatus.isBookAvailable() {
            bookAvaiability.textColor = .green
            rentButton.layer.borderColor = UIColor.blueBorder().cgColor
            rentButton.backgroundColor = UIColor.blueBorder()
        } else {
            bookAvaiability.textColor = .red
            rentButton.layer.borderColor = UIColor.greyButton().cgColor
            rentButton.backgroundColor = UIColor.greyButton()
        }
    }
    @IBAction func rentButton(_ sender: Any) {
        delegate?.rentBook()
    }
}
