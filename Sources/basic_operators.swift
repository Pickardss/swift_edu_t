func runBasicOperators() {
    // ==================================================
    // TERMINOLOGY
    // ==================================================
    // Operatörler: Değerler üzerinde işlem yapmak için kullanılan semboller veya ifadeler.
    // Örneğin, + operatörü toplama işlemini temsil eder.
    
    // ==================================================
    // ASSIGNMENT OPERATOR
    // ==================================================
    var a = 10 // Atama operatörü (=) kullanılarak a değişkenine 10 değeri atanır.
    var b = 20
    b = a // b artık a'nın değerine eşittir.
    a = b // a artık b'nin değerine eşittir.
    print("Assignment: a = \(a), b = \(b)")
    
    // ==================================================
    // ARITHMETIC OPERATORS
    // ==================================================
    let addition = 2 + 3 // Toplama
    let subtraction = 5 - 2 // Çıkarma
    let multiplication = 2 * 3 // Çarpma
    let division = 10 / 2 // Bölme
    print("Arithmetic: +: \(addition), -: \(subtraction), *: \(multiplication), /: \(division)")
    
    // ==================================================
    // REMAINDER OPERATOR
    // ==================================================
    let remainder = 10 % 3 // Kalan bulma (modulus) operatörü
    print("Remainder: 10 % 3 = \(remainder)")
    
    // ==================================================
    // UNARY MINUS OPERATOR
    // ==================================================
    let positiveNumber = 5
    let negativeNumber = -positiveNumber // Unary minus operatörüyle negatif yapılır
    print("Unary Minus: \(negativeNumber)")
    
    // ==================================================
    // UNARY PLUS OPERATOR
    // ==================================================
    let alreadyPositive = +positiveNumber // Unary plus hiçbir değişiklik yapmaz
    print("Unary Plus: \(alreadyPositive)")
    
    // ==================================================
    // COMPOUND ASSIGNMENT OPERATORS
    // ==================================================
    var compound = 5
    compound += 3 // compound = compound + 3
    compound -= 2 // compound = compound - 2
    print("Compound Assignment: \(compound)")
    
    // ==================================================
    // COMPARISON OPERATORS
    // ==================================================
    let isEqual = (1 == 1) // Eşittir
    let isNotEqual = (1 != 2) // Eşit değildir
    let isGreater = (2 > 1) // Büyüktür
    let isLess = (1 < 2) // Küçüktür
    let isGreaterOrEqual = (2 >= 2) // Büyük veya eşittir
    let isLessOrEqual = (1 <= 2) // Küçük veya eşittir
    print("Comparison: == \(isEqual), != \(isNotEqual), > \(isGreater), < \(isLess), >= \(isGreaterOrEqual), <= \(isLessOrEqual)")
    
    // ==================================================
    // TERNARY CONDITIONAL OPERATOR
    // ==================================================
    let condition = true
    let result = condition ? "True Result" : "False Result" // Şartlı ifadeyle değer döner
    print("Ternary Conditional: \(result)")
    
    // ==================================================
    // NIL-COALESCING OPERATOR
    // ==================================================
    let optionalValue: String? = nil
    let defaultValue = optionalValue ?? "Default Value" // Nil ise varsayılan değer atanır
    print("Nil-Coalescing: \(defaultValue)")
    
    // ==================================================
    // RANGE OPERATORS
    // ==================================================
    // Closed Range Operator
    for i in 1...5 {
        print("Closed Range: \(i)") // 1'den 5'e kadar tüm değerleri içerir
    }
    // Half-Open Range Operator
    for i in 1..<5 {
        print("Half-Open Range: \(i)") // 1'den 4'e kadar tüm değerleri içerir
    }
    // One-Sided Ranges
    let array = [1, 2, 3, 4, 5]
    print("One-Sided Range: \(array[2...])") // 2. indexten sonrasını alır
    
    // ==================================================
    // LOGICAL OPERATORS
    // ==================================================
    // Logical NOT
    let notTrue = !true
    print("Logical NOT: \(notTrue)") // false döner
    
    // Logical AND
    let andResult = true && false // false
    print("Logical AND: \(andResult)")
    
    // Logical OR
    let orResult = true || false // true
    print("Logical OR: \(orResult)")
    
    // Combining Logical Operators
    let combinedResult = (true || false) && !false
    print("Combined Logical: \(combinedResult)") // true
    
    // ==================================================
    // EXPLICIT PARENTHESES
    // ==================================================
    let calculatedResult = (2 + 3) * 4 // Parantezler işlemlerin sırasını belirler
    print("Explicit Parentheses: \(calculatedResult)")
}