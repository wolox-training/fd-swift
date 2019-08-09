//
//  UIImageViewExtension.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 08/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageUsingCache(withUrl urlString: String) {
        image = UIImage.bookCover
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    self.image = image
                }
            }
        }).resume()
    }

}
