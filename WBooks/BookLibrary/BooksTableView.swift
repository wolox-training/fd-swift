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
    table.backgroundColor = UIColor(red: 0.92, green: 0.96, blue: 0.98, alpha: 1)
    table.separatorStyle = .none
        }
    }

}
