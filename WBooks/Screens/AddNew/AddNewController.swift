//
//  AddNewController.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore
import ReactiveCocoa
import ReactiveSwift

class AddNewController: UIViewController {
    
    private let _view: AddNewView = AddNewView.loadFromNib()!
    
    override func loadView() {
        _view.configureDetailTableView()
        view = _view
    }
    
    lazy var viewModel: AddNewViewModel = {
        return AddNewViewModel(booksRepository: WBNetworkManager(configuration: networkingConfiguration, defaultHeaders: WBNetworkManager.commonHeaders()))
    }()
    
    var bookTitle = MutableProperty("")
    var bookAuthor = MutableProperty("")
    var bookYear = MutableProperty("")
    var bookGenre = MutableProperty("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "ADDNEW".localized()
        
        _view.addImage?.reactive.controlEvents(.touchUpInside)
            .observeValues { _ in
                let alertController = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                
                let chooseAction = UIAlertAction(title: "Gallery", style: .default) { _ in
                    let imagePickerController = UIImagePickerController()
                    imagePickerController.delegate = self
                    imagePickerController.sourceType = .photoLibrary
                    self.present(imagePickerController, animated: true, completion: .none)
                }
                alertController.addAction(chooseAction)
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let takeAction = UIAlertAction(title: "Camera", style: .default) { _ in
                        let imagePickerController = UIImagePickerController()
                        imagePickerController.delegate = self
                        imagePickerController.sourceType = .camera
                        self.present(imagePickerController, animated: true, completion: .none)
                    }
                    alertController.addAction(takeAction)
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: .none)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
        }
        
        /*bookTitle <~ _view.bookName.reactive.continuousTextValues
        bookAuthor <~ _view.bookAuthor.reactive.continuousTextValues
        bookYear <~ _view.bookYear.reactive.continuousTextValues
        bookGenre <~ _view.bookGenre.reactive.continuousTextValues
        
        viewModel.addBook.values.observeValues { [unowned self] _ in
            self._view.reloadViewAsEmpty()
        }*/
        
        viewModel.addBook.errors.observeValues { [unowned self] error in
            self.showAlertMessage(message: error.localizedDescription)
            print(error.localizedDescription)
        }
        
        let book = Book(id: 0, title: self.bookTitle.value, author: self.bookAuthor.value, genre: self.bookGenre.value, status: BookStatus.available.rawValue, year: self.bookYear.value, image: "")
        
        _view.submit?.reactive.pressed = CocoaAction(viewModel.addBook, input: book)
    }
    
}

extension AddNewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
        }
        
        _view.addImage.setImage(image, for: UIControl.State.normal)
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
