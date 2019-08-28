//
//  WBNetworkManager.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import Alamofire
import ReactiveCocoa
import ReactiveSwift
import Networking
import Argo
import Curry
import Runes
import Result

var networkingConfiguration: NetworkingConfiguration {
    var config = NetworkingConfiguration()
    config.domainURL = "swift-training-backend.herokuapp.com"
    return config
}

class WBNetworkManager: AbstractRepository {
    
    public func fetchBooks() -> SignalProducer<[Book], RepositoryError> {
        let path = "books"
        
        return performRequest(method: .get, path: path) { json in
            return decode(json).toResult()
        }
    }
    
    public func getBookComments(book: Book) -> SignalProducer<[BookComment], RepositoryError> {
        let path = "books/\(book.id)/comments"
        
        return performRequest(method: .get, path: path) { json in
            return decode(json).toResult()
        }
    }
    
    public func rentBook(book: Book) -> SignalProducer<Void, RepositoryError> {
        let userId = 7
        let path = "users/\(userId)/rents"
        let params: [String: Any] = ["userID": userId,
                                     "bookID": book.id,
                                     "from": Date.customDate(with: Date()),
                                     "to": Date.customDate(with: Calendar.current.date(byAdding: .day, value: 1, to: Date())!)]
        
        return performRequest(method: .post, path: path, parameters: params) { _ in
            Result(value: ())
        }
    }
    
    class func commonHeaders() -> [String: String] {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
}
