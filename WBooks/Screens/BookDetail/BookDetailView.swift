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
    
    @IBOutlet weak var bookTitle: UILabel! {
        didSet {
            bookTitle.lineBreakMode = .byWordWrapping
            bookTitle.numberOfLines = 0
        }
    }
    @IBOutlet weak var bookAvaiability: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var wishlistButton: UIButton! {
        didSet {
            wishlistButton.layer.cornerRadius = Constants.cornerRadiusBig
            wishlistButton.layer.borderWidth = 1
            wishlistButton.layer.borderColor = UIColor.blueBorder().cgColor
            wishlistButton.setTitleColor(.blueBorder(), for: .normal)
        }
    }
    @IBOutlet weak var rentButton: UIButton! {
        didSet {
            rentButton.layer.cornerRadius = Constants.cornerRadiusBig
            rentButton.layer.borderWidth = 1
            rentButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var bookImage: UIImageView!
    
    weak var delegate: DetailBookDelegate?
    
    func setup(with bookModel: Book) {
        bookImage.loadImageUsingCache(withUrl: bookModel.image)
        bookTitle.text = bookModel.title
        bookAuthor.text = bookModel.author
        bookAvaiability.text = bookModel.bookStatus.bookStatusText()
        bookAuthor.text = bookModel.author
        bookYear.text = bookModel.year
        bookGenre.text = bookModel.genre
        if bookModel.bookStatus.isBookAvailable() {
            bookAvaiability.textColor = .green
            rentButton.layer.borderColor = UIColor.blueBorder().cgColor
            rentButton.setBlueGradient()
        } else {
            bookAvaiability.textColor = .red
            rentButton.layer.borderColor = UIColor.grey().cgColor
            rentButton.setGreyGradient()
        }
    }
    @IBAction func rentButton(_ sender: Any) {
        delegate?.rentBook()
    }
}
