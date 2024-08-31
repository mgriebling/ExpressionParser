//
//  LaTeX.swift
//  MakeMathML
//
//  Created by Mike Griebling on 13 Aug 2017.
//  Copyright © 2017 Computer Inspirations. All rights reserved.
//

import Foundation

extension Node {
    
    // mathml constructors
    
    func symbol(_ x: String, size: Int = 0) -> String {
        //let s = size == 0 ? "" : " mathsize=\"\(size)\""
        return "\(x)"
    }
    
    func variable(_ x: String, size: Int = 0) -> String {
        //let s = size == 0 ? "" : " mathsize=\"\(size)\""
        return "\(x)"
    }
    
    func number(_ val: Double, size: Int = 0) -> String {
        var v = String(val)
        if v.hasSuffix(".0") { v = v.replacingOccurrences(of: ".0", with: "") }
        return "\(v)"
    }
    
    func power(_ x: String, to y: String) -> String {
        return "\(x)^{\(y)}"
    }
    
    func fraction(_ x: String, over y: String) -> String {
        return "\\frac{\(x)}{\(y)}"
    }
    
    func root(_ x: String, n: Int) -> String {
        if n == 2 {
            return "\\sqrt{\(x)}"
        } else {
            return "\\sqrt[\(number(Double(n)))]{\(x)}"
        }
    }
    
    func isComplex(_ x: String) -> Bool {
        return x.contains("<mfrac>") || x.contains("<msup>") || x.contains("<msqrt>") || x.contains("<mroot>") ||
               x.contains("<mrow>")
    }
    
    func fenced(_ x: String, open: String = "(", close: String = ")") -> String {
        let braces = ""
        if isComplex(x) {
            return "<mfenced\(braces)>\n<mrow>\(x)</mrow></mfenced>\n"
        } else {
            return symbol(open) + x + symbol(close)
        }
    }
    
}

public class LaTeX {
    
    var presentation: String = ""
    var semantic: String = ""
    
    public init(_ equation: String) {
        
    }
    
    
}
