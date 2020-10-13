//
//  validationTesting.swift
//  UnitTestTests
//
//  Created by sarath kumar on 13/10/20.
//  Copyright © 2020 sarath kumar. All rights reserved.
//

import XCTest
@testable import UnitTest

class validationTesting: XCTestCase {
    
    var validation: ValidationService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        validation = ValidationService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        validation = nil
        super.tearDown()
    }

    func test_valid_username() throws {
        XCTAssertNoThrow(try validation.validateUsername(username: "sarath"))
    }
    
    func test_username_isnil() throws {
        let expectedError = ValidationError.invalidValue
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername(username: nil)) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
        
    }
    
    func test_username_tooLong() throws {
        
        let expectedError = ValidationError.usernameTooLong
        var error: ValidationError?
        
        XCTAssertThrowsError(try validation.validateUsername(username: "i am sarath and i am a ios developer")) { thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertTrue("sarath".count == 6)
        XCTAssertEqual(expectedError, error)
        XCTAssertEqual(expectedError.errorDescription, error?.errorDescription)
    }

}
