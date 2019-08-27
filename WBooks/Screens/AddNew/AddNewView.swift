//
//  AddNew.swift
//  WBooks
//
//  Created by Federico Agustin Diaz on 31/07/2019.
//  Copyright © 2019 Wolox. All rights reserved.
//

import UIKit
import WolmoCore

class AddNewView: UIView, NibLoadable {
    
    @IBOutlet weak var background: UIView! {
        didSet {
            background.layer.cornerRadius = 5
            background.backgroundColor = .white
        }
    }
    
    @IBOutlet weak var addImage: UIButton! {
        didSet {
            addImage.setImage(UIImage.addNew, for: .normal)
        }
    }
    
    @IBOutlet weak var submit: UIButton! {
        didSet {
            submit.layer.cornerRadius = Constants.cornerRadiusBig
            submit.layer.borderWidth = 1
            submit.clipsToBounds = true
            submit.setTitle("SUBMIT".localized(), for: .normal)
            submit.layer.borderColor = UIColor.blueBorder().cgColor
            submit.setBlueGradient()
        }
    }
    
    @IBOutlet weak var bookName: UITextField! {
        didSet {
            bookName.placeholder = "BOOK_NAME".localized()
            bookName.setBottomLine()
        }
    }
    
    @IBOutlet weak var bookAuthor: UITextField! {
        didSet {
            bookAuthor.placeholder = "BOOK_AUTHOR".localized()
            bookAuthor.setBottomLine()
        }
    }
    
    @IBOutlet weak var bookYear: UITextField! {
        didSet {
            bookYear.placeholder = "BOOK_YEAR".localized()
            bookYear.setBottomLine()
            
        }
    }
    
    @IBOutlet weak var bookGenre: UITextField! {
        didSet {
            bookGenre.placeholder = "BOOK_TOPIC".localized()
            bookGenre.setBottomLine()
        }
    }
    
    @IBOutlet weak var bookDescription: UITextField! {
        didSet {
            bookDescription.placeholder = "BOOK_DESCRIPTION".localized()
            bookDescription.setBottomLine()
        }
    }
    
    func configureDetailTableView() {
        backgroundColor = .backgroundLightBlue()
    }
    
}

/*
    @IBOutlet weak var nameTextField: WBTextField! {
        didSet {
            nameTextField.placeholder = "NAME_BOOK_PLACEHOLDER".localized()
            nameTextField.delegate = self
            nameTextField.returnKeyType = .next
            nameTextField.wbTextFieldProtocol = self
            nameTextField.tag = TextFieldTag.name.rawValue
        }
    }
}
}*/
