func runClosuresExamples() {
    // ==================================================
    // CLOSURE EXPRESSIONS
    // ==================================================
    let multiplyClosure = { (a: Int, b: Int) -> Int in
        return a * b
    }
    print("Multiplication Result: \(multiplyClosure(3, 4))")

    // ==================================================
    // THE SORTED METHOD
    // ==================================================
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    let sortedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
        return s1 < s2
    })
    print("Sorted Names: \(sortedNames)")

    // ==================================================
    // CLOSURE EXPRESSION SYNTAX
    // ==================================================
    let reversedNames = names.sorted { $0 > $1 }
    print("Reversed Names: \(reversedNames)")

    // ==================================================
    // INFERRING TYPE FROM CONTEXT
    // ==================================================
    let inferredClosure = names.sorted(by: { s1, s2 in s1 < s2 })
    print("Inferred Closure: \(inferredClosure)")

    // ==================================================
    // IMPLICIT RETURNS FROM SINGLE-EXPRESSION CLOSURES
    // ==================================================
    let implicitlyReturnedClosure = names.sorted(by: { $0 < $1 })
    print("Implicitly Returned Closure: \(implicitlyReturnedClosure)")

    // ==================================================
    // SHORTHAND ARGUMENT NAMES
    // ==================================================
    let shorthandClosure = names.sorted(by: <)
    print("Shorthand Closure: \(shorthandClosure)")

    // ==================================================
    // OPERATOR METHODS
    // ==================================================
    let operatorClosure = names.sorted(by: >)
    print("Operator Closure: \(operatorClosure)")

    // ==================================================
    // TRAILING CLOSURES
    // ==================================================
    let trailingClosure = names.sorted { $0 < $1 }
    print("Trailing Closure: \(trailingClosure)")

    // ==================================================
    // CAPTURING VALUES
    // ==================================================
    func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var total = 0
        return {
            total += amount
            return total
        }
    }
    let incrementByTwo = makeIncrementer(forIncrement: 2)
    print("Increment by Two: \(incrementByTwo())")
    print("Increment by Two: \(incrementByTwo())")

    // ==================================================
    // CLOSURES ARE REFERENCE TYPES
    // ==================================================
    let anotherIncrementer = incrementByTwo
    print("Another Incrementer: \(anotherIncrementer())")

    // ==================================================
    // ESCAPING CLOSURES
    // ==================================================
    var completionHandlers: [() -> Void] = []
    func addCompletionHandler(_ handler: @escaping () -> Void) {
        completionHandlers.append(handler)
    }
    addCompletionHandler {
        print("Escaping Closure Executed")
    }
    completionHandlers.forEach { $0() }

    // ==================================================
    // AUTOCLOSURES
    // ==================================================
    func serve(customer customerProvider: @autoclosure () -> String) {
        print("Now serving \(customerProvider())!")
    }
    serve(customer: "Alice")
}

/*
 SUMMARY:
 Bu kod, Swift'teki closure'ların nasıl çalıştığını ve nerelerde kullanılabileceğini açıklıyor:

 1. **Closure Expressions:**
    - Closure ifadeleri, fonksiyonlara benzer ancak isimleri olmayan kod bloklarıdır.
    - `(a: Int, b: Int) -> Int in` ile parametre, dönüş türü ve closure gövdesi belirtilir.

 2. **The Sorted Method:**
    - `sorted(by:)` metodu closure'ları kullanarak bir diziyi sıralar.
    - Closure, sıralama kriterini tanımlar.

 3. **Closure Expression Syntax:**
    - Closure ifadelerindeki gereksiz bilgileri kaldırarak daha kısa bir sözdizimi sağlar.
    - `$0` ve `$1` gibi shorthand argüman isimleri kullanılır.

 4. **Inferring Type From Context:**
    - Closure içindeki parametre ve dönüş türü, bağlamdan otomatik olarak çıkarılır.

 5. **Implicit Returns From Single-Expression Closures:**
    - Tek ifadeli closure'larda `return` yazılması gerekmez.

 6. **Shorthand Argument Names:**
    - `$0`, `$1` gibi kısa argüman isimleri closure ifadelerini daha okunabilir hale getirir.

 7. **Operator Methods:**
    - `<` veya `>` gibi operatörler doğrudan closure olarak kullanılabilir.

 8. **Trailing Closures:**
    - Closure, bir fonksiyonun son parametresi olduğunda, parantezlerin dışında yazılabilir.

 9. **Capturing Values:**
    - Closure'lar, tanımlandıkları ortamdan değerleri yakalayabilir.
    - Örneğin, bir sayaç oluşturmak için kullanılır.

 10. **Closures Are Reference Types:**
    - Closure'lar referans tiplerdir, bu nedenle bir closure başka bir değişkene atandığında aynı referansı paylaşır.

 11. **Escaping Closures:**
    - `@escaping` ile bir closure, bir fonksiyonun dışında çalıştırılmak üzere saklanabilir.

 12. **Autoclosures:**
    - `@autoclosure`, bir closure'ı otomatik olarak oluşturur ve çağırırken daha kısa bir sözdizimi sağlar.

 Bu kod, closure'ların temel özelliklerini ve güçlü yanlarını anlamak için kapsamlı bir rehber sunar.
 Closure'lar, fonksiyonel programlama kavramlarını uygulamak için önemlidir.
*/