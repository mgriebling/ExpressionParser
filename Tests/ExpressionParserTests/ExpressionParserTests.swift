import XCTest
@testable import ExpressionParser

final class ExpressionParserTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        let e = ExpressionParser("56.7sin(pi/2)")
        if let b = e.parse() {
            print(b)
        }
    }
}
