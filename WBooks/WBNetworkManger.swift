//
//  WBNetworkManager.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 01/08/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import Alamofire

enum BookError: Error {
    case decodeError
}

class WBNetworkManager: NSObject {
    
    public static let manager = WBNetworkManager()
    
    override init() {}
    
    public func fetchBooks(onSuccess: @escaping ([Book]) -> Void, onError: @escaping (Error) -> Void) {
        
        let url = URL(string: "https://swift-training-backend.herokuapp.com/books")!
        
        request(url, method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONbooks = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(BookError.decodeError)
                    return
                }
                guard let books = try? JSONDecoder().decode([Book].self, from: JSONbooks) else {
                    onError(BookError.decodeError)
                    return
                }
                onSuccess(books)
            case .failure(let error):
                onError(error)
                }
            }
        }
    
    public func getBookComments(book: Book, onSuccess: @escaping ([BookComment]) -> Void, onError: @escaping (Error) -> Void) {
        let url = URL(string: "https://swift-training-backend.herokuapp.com/books/\(book.id)/comments")!
        let headers: [String: String] = commonHeaders()
        
        request(url, method: HTTPMethod.get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONrent = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(BookError.decodeError)
                    return
                }
                guard let comments = try? JSONDecoder().decode([BookComment].self, from: JSONrent) else {
                    onError(BookError.decodeError)
                    return
                }
                onSuccess(comments)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    public func rentBook(book: Book, onSuccess: @escaping (BookRent) -> Void, onError: @escaping (Error) -> Void) {
        
        let userId = 7
        
        let url = URL(string: "https://swift-training-backend.herokuapp.com/users/\(userId)/rents")!
        
        let params: [String: Any] = ["userID": userId, "bookID": book.id, "from": firstDate(), "to": secondDate()]
        request(url, method: HTTPMethod.post, parameters: params, encoding: JSONEncoding.default, headers: commonHeaders()).responseJSON { response in
            switch response.result {
            case .success(let value):
                guard let JSONrent = try? JSONSerialization.data(withJSONObject: value, options: []) else {
                    onError(BookError.decodeError)
                    return
                }
                guard let rent = try? JSONDecoder().decode(BookRent.self, from: JSONrent) else {
                    onError(BookError.decodeError)
                    return
                }
                onSuccess(rent)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    private func firstDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    private func secondDate() -> String {
        let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: tomorrowDate)
    }
    
    private func commonHeaders() -> [String: String] {
        return ["Content-Type": "application/json",
                "Accept": "application/json"]
    }
    
}
