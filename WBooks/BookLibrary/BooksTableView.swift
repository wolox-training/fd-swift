//
//  BookTableView.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class BooksTableView: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var table: UITableView! {
        didSet {
            table.backgroundColor = .backgroundLightBlue()
            table.separatorStyle = .none
        }
    }

}
