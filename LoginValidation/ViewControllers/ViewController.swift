//
//  ViewController.swift
//  LoginValidation
//
//  Created by Andrey on 21/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var checkButton: UIButton!
    
    private let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkButton.layer.cornerRadius = 5
    }

    @IBAction private func checkButtonTapped(_ sender: UIButton) {
        let text = textField.text ?? ""
        let checkResult = validator.checkString(text)
        switch checkResult {
        case true:
            resultLabel.textColor = .green
            resultLabel.text = "Логин корректный"
        case false:
            resultLabel.textColor = .red
            resultLabel.text = "Логин некорректный"
        }
    }
}

		
