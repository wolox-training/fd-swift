//
//  BookInfo.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 25/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

class BookInfo: NSObject {
    
    public static let sharedInstance = BookInfo()
    
    override init() {}
    
    let imageCache = NSCache<NSString, UIImage>()
    
}
