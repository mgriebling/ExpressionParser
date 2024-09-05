import XCTest
@testable import ExpressionParser

final class ExpressionParserTests: XCTestCase {
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest
        
        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
        let e = ExpressionParser("(-b+sqrt(b^2-4a*c))/2a")
        Ident.addSymbol(("a", 1))
        Ident.addSymbol(("b", -3))
        Ident.addSymbol(("c", -4))
        if let b = e.parse() {
            print(b)
        }
    }
}
