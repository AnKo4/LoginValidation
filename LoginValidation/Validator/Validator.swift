//
//  File.swift
//  LoginValidation
//
//  Created by Andrey on 21/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import Foundation

class Validator {
    
    private let loginPattern = "(^[a-z]{1}[a-z0-9\\.\\-]{2,31}$)"
    private let emailPattern = "(^[a-z]{1}([a-z0-9.\\-_])*+@[a-z0-9.-]+\\.[a-z]{2,4}$)"
    

    func checkString(_ string: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: loginPattern + "|" + emailPattern, options: .caseInsensitive) else {
            print("Incorrect regex")
            return false
        }
        let range = NSRange(location: 0, length: string.utf16.count)
        return (string.utf16.count < 33) && (regex.firstMatch(in: string, options: [], range: range) != nil)
    }
}
