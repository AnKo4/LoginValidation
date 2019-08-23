//
//  LoginValidationTests.swift
//  LoginValidationTests
//
//  Created by Andrey on 21/08/2019.
//  Copyright © 2019 Andrey Kochetkov. All rights reserved.
//

import XCTest
@testable import LoginValidation

class LoginValidationTests: XCTestCase {

    var validator = Validator()
    var testString: String = ""
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    // Тест на ввод корректного логина
    func testValidLogins() {
        testString = "Andrey"
        XCTAssertTrue(validator.checkString(testString))
        
        testString = "And"
        XCTAssertTrue(validator.checkString(testString))

        testString = "A8-."
        XCTAssertTrue(validator.checkString(testString))

        testString = "Andrey."
        XCTAssertTrue(validator.checkString(testString))

        testString = "Andr.-ey"
        XCTAssertTrue(validator.checkString(testString))

        testString = "AndreyAndreyAndreyAndreyAndreyAn"
        XCTAssertTrue(validator.checkString(testString))

        testString = "Andrey@mail.info"
        XCTAssertTrue(validator.checkString(testString))

        testString = "Andrey8@t.me"
        XCTAssertTrue(validator.checkString(testString))

        testString = "A@rf.rf"
        XCTAssertTrue(validator.checkString(testString))

        testString = "An-drey@google.mars"
        XCTAssertTrue(validator.checkString(testString))
    }
    
    // Тест на ввод некорректного логина
    func testInvalidLogins() {
        testString = "A"
        XCTAssertFalse(validator.checkString(testString))
 
        testString = "A8"
        XCTAssertFalse(validator.checkString(testString))
    
        testString = "8Andrey"
        XCTAssertFalse(validator.checkString(testString))
    
        testString = "-Andr"
        XCTAssertFalse(validator.checkString(testString))
    
        testString = "AndreyAndreyAndreyAndreyAndreyAnd"
        XCTAssertFalse(validator.checkString(testString))

        testString = "A.@mail.r"
        XCTAssertFalse(validator.checkString(testString))
    
        testString = "8@mail.r"
        XCTAssertFalse(validator.checkString(testString))
    
        testString = "-A@mail.info"
        XCTAssertFalse(validator.checkString(testString))
    
        testString = "Andrey@.info"
        XCTAssertFalse(validator.checkString(testString))
    }

}
