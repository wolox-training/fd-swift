//
//  BookDetailFullView.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 06/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import WolmoCore

class BookDetailFullView: UIView, NibLoadable {
    
    @IBOutlet weak var detailHeaderView: BookDetail!
    @IBOutlet weak var detailTable: UITableView!
    
    func configureDetailTableView() {
        
        backgroundColor = .backgroundLightBlue()
        detailTable.separatorStyle = .none
        
        detailTable.layer.cornerRadius = 5
    }
}