//
//  BookCommentCellView.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookCommentCellView: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!{
        didSet {
            userImage.layer.cornerRadius = userImage.frame.size.width/2
        }
    }
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = .white
        backgroundColor = .clear
        selectionStyle = .blue
    }
    
    var commentViewModel: BookComment? {
        didSet {
            userImage.loadImageUsingCache(withUrl: commentViewModel?.user.imageURL ?? "")
            userName.text = commentViewModel?.user.username
            userComment.text = commentViewModel?.content
        }
    }
}
