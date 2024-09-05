# ExpressionParser

The **ExpressionParser** package parses and evaluates mathematical expressions
and produces both a $\LaTeX$ translation and an evaluated result.

For example, the following:

```swift
let e = ExpressionParser("56.7sin(pi/2)")
if let b = e.parse() {
    print(b)
}
```

produces an output of:

```
("56.7{}\\sin(\\frac{\\pi}{2})", 56.7)
```

where the $\LaTeX$ string gives the following typeset equation
$56.7{}\sin(\frac{\pi}{2})$

## Usage
In your project's `Package.swift` file add a dependency like

```
dependencies: [
    .package(url: "https://github.com/mgriebling/BigInt.git", from: "2.0.0"),
]
```

## Theory

**ExpressionParser** contains two source files, `Parser.swift` and `Scanner.swift`.
They were produced by the Coco compiler translating an input ATG (Attributable
Target Grammar) file (exp.atg) that describes the operations to be scanned
and parsed in a compact text format.  The `Coco` compiler generator also
requires some `.frame` files into which sections of code are inserted to
produce the final swift parser and scanner files.  An Abstract Syntax Tree
representation (AST) is built up using the `AST.swift` data type. This
tree is then evaluated to generate the $\LaTeX$ translation and evaluates
a result.  For more details about `Coco` refer to the 
https://ssw.jku.at/Research/Projects/Coco/ web site.
