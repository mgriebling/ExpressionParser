// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct ExpressionParser {
    
    var input : InputStream
    var scanner : Scanner
    
    public init(_ expression: String) {
        self.input = InputStream(data: expression.data(using: .ascii)!)
        self.scanner = Scanner(s: self.input)
        
        // add syome symbols to the parser
        Ident.addSymbol(("x", 10))
    }
    
    public func parse () -> (String, Double)? {
        let parser = Parser(scanner: scanner)
        if parser.errors.count > 0 {
            print(parser.errors)
            return nil
        }
        return parser.Parse()
    }
}
