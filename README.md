[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmgriebling%2FExpressionParser%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/mgriebling/ExpressionParser)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fmgriebling%2FExpressionParser%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/mgriebling/ExpressionParser)

# ExpressionParser

The **ExpressionParser** package parses and evaluates mathematical expressions
and produces both a `LaTeX` translation and an evaluated result.

For example, the following:

```swift
let e = ExpressionParser("(-b+sqrt(b^2-4a*c))/2a")
Ident.addSymbol(("a", 1))
Ident.addSymbol(("b", -3))
Ident.addSymbol(("c", -4))
if let b = e.parse() {
    print(b)
}
```

produces an output of:

```
("\\frac{-{b}+\\sqrt{{b}^{2}-4{}{a}\\times{c}}}{2{}{a}}", 4.0)
```

where the `LaTeX` string gives the following typeset equation

$\frac{-{b}+\sqrt{{b}^{2}-4{}{a}\times{c}}}{2{}{a}}$

## Usage
In your project's `Package.swift` file add a dependency like

```
dependencies: [
    .package(url: "https://github.com/mgriebling/ExpressionParser.git", from: "0.1.0"),
]
```

## Theory

**ExpressionParser** contains two source files, `Parser.swift` and `Scanner.swift`.
They were produced by the Coco compiler [https://github.com/mgriebling/Coco]
translating an input ATG (Attributed Grammar) file (exp.atg) that describes the operations to be scanned
and parsed in a compact text format.  The `Coco` compiler generator also
requires some `.frame` files into which sections of code are inserted to
produce the final swift parser and scanner files.  An Abstract Syntax Tree
representation (AST) is built up using the `AST.swift` data type. This
tree is then evaluated to generate the `LaTeX` translation and evaluates
a result.  For more details about `Coco` refer to the 
https://ssw.jku.at/Research/Projects/Coco/ web site.
