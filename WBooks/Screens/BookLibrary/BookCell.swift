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
    
    func configureCell(with book: Book, with cell: BookCell) {
        cell.bookImage.image = UIImage.bookCover
        
        let urlString = book.image
        if let cachedImage = BookInfo.sharedInstance.imageCache.object(forKey: NSString(string: (book.image))) {
            DispatchQueue.main.async {
                cell.bookImage.image = cachedImage
            }
        } else {
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    let image: UIImage = UIImage(data: data)!
                    DispatchQueue.main.async {
                        BookInfo.sharedInstance.imageCache.setObject(image, forKey: NSString(string: urlString))
                        cell.bookImage.image = image
                    }
                }
            }
        }
        cell.bookTitle.text = book.title
        cell.bookAuthor.text = book.author
    }
}
