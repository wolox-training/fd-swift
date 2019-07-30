//
//  BookTableView.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class TableView: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var table: UITableView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
