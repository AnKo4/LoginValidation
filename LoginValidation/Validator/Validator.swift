//
//  File.swift
//  LoginValidation
//
//  Created by Andrey on 21/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import Foundation

class Validator {
    // Паттерн для логина
    private let loginPattern = "(^[a-z]{1}[a-z0-9\\.\\-]{2,31}$)"
    // Паттерн для email
    private let emailPattern = "(^[a-z]{1}([a-z0-9.\\-_])*+@[a-z0-9.-]+\\.[a-z]{2,4}$)"
    

    func checkString(_ string: String) -> Bool {
        // Составляю регулярное выражение для проверки
        // Выражение имеет вид "(Паттерн для логина) ИЛИ (Паттерн для email)"
        guard let regex = try? NSRegularExpression(pattern: loginPattern + "|" + emailPattern, options: .caseInsensitive) else {
            print("Incorrect regex")
            return false
        }
        // Задаю диапазон в строке для проверки. В данном случае диапазон охватывает всю строку
        // utf16 на случай если пользователь решить ввести эмодзи
        let range = NSRange(location: 0, length: string.utf16.count)
        // Проверяю на длину строки не более 32 символов и на соответствие регулярному выражению
        return (string.utf16.count < 33) && (regex.firstMatch(in: string, options: [], range: range) != nil)
    }
}
