//
//  UIDateExtension.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 15/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import Foundation
import WolmoCore

extension Date {
    static func customDate(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
    }
}
