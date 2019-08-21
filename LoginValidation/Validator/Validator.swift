//
//  File.swift
//  LoginValidation
//
//  Created by Andrey on 21/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import Foundation

class Validator {
    
    //MARK: - Here I used try! because the pattern is hard-coded and is valid
    private let regex = try! NSRegularExpression(pattern: "[a-z]{1}+[a-z0-9\\.\\-\\@]{2,31}", options: .caseInsensitive)
    
    func checkString(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return regex.firstMatch(in: string, options: [], range: range) != nil
    }
}
