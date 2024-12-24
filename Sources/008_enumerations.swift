func runEnumerationsExamples() {
    // ==================================================
    // ENUMERATION SYNTAX
    // ==================================================
    enum CompassPoint {
        case north
        case south
        case east
        case west
    }
    var direction = CompassPoint.north // Enum sabiti atanır
    print("Direction: \(direction)")

    direction = .east // Kısaltılmış enum kullanım örneği
    print("New Direction: \(direction)")

    // ==================================================
    // MATCHING ENUMERATION VALUES WITH A SWITCH STATEMENT
    // ==================================================
    switch direction {
    case .north:
        print("Heading North") // Yön kuzey ise bu çalışır
    case .south:
        print("Heading South")
    case .east:
        print("Heading East")
    case .west:
        print("Heading West")
    }

    // ==================================================
    // ITERATING OVER ENUMERATION CASES
    // ==================================================
    enum Beverage: CaseIterable { // CaseIterable protokolü tüm durumları döndürmek için kullanılır
        case coffee, tea, juice
    }
    for beverage in Beverage.allCases { // Tüm enum durumları üzerinde döngü
        print("Beverage: \(beverage)")
    }

    // ==================================================
    // ASSOCIATED VALUES
    // ==================================================
    enum Barcode {
        case upc(Int, Int, Int, Int) // İlişkili değerlerle enum
        case qrCode(String)
    }
    let productCode = Barcode.upc(8, 85909, 51226, 3)
    switch productCode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case .qrCode(let code):
        print("QR Code: \(code)")
    }

    // ==================================================
    // RAW VALUES
    // ==================================================
    enum ASCIIControlCharacter: Character { // Enum ile ham değerler kullanımı
        case tab = "\t"
        case lineFeed = "\n"
        case carriageReturn = "\r"
    }
    let tabCharacter = ASCIIControlCharacter.tab.rawValue
    print("Tab Character: \(tabCharacter)")

    // ==================================================
    // IMPLICITLY ASSIGNED RAW VALUES
    // ==================================================
    enum Planet: Int { // Ham değerler otomatik olarak atanır
        case mercury = 1, venus, earth, mars
    }
    let earth = Planet.earth.rawValue // Ham değeri alır
    print("Earth is the \(earth) planet from the Sun.")

    // ==================================================
    // INITIALIZING FROM A RAW VALUE
    // ==================================================
    if let possiblePlanet = Planet(rawValue: 3) { // Ham değerden enum başlatılır
        print("The third planet is \(possiblePlanet).")
    } else {
        print("No such planet.")
    }

    // ==================================================
    // RECURSIVE ENUMERATIONS
    // ==================================================
    enum ArithmeticExpression {
        case number(Int) // Sayı
        indirect case addition(ArithmeticExpression, ArithmeticExpression) // Toplama işlemi
        indirect case multiplication(ArithmeticExpression, ArithmeticExpression) // Çarpma işlemi
    }

    // Örnek bir ifade oluşturulur: (5 + 4) * 2
    let five = ArithmeticExpression.number(5)
    let four = ArithmeticExpression.number(4)
    let sum = ArithmeticExpression.addition(five, four)
    let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case .number(let value):
            return value // Sayı değeri döndürülür
        case .addition(let left, let right):
            return evaluate(left) + evaluate(right) // Toplama işlemi değerlendirilir
        case .multiplication(let left, let right):
            return evaluate(left) * evaluate(right) // Çarpma işlemi değerlendirilir
        }
    }

    print("Result of Expression: \(evaluate(product))") // İfadenin sonucu hesaplanır
}

/*
 SUMMARY:
 Bu kod, Swift'te enumerations (enum) kullanımı ve çeşitli özelliklerini kapsamlı bir şekilde açıklar:

 1. **Enumeration Syntax:**
    - `enum` tanımlama ve kullanım örnekleri.
    - Değişkenlere enum değerlerinin atanması ve kısaltılmış yazım.

 2. **Matching Enumeration Values with a Switch Statement:**
    - `switch` kullanarak enum durumlarını kontrol etme.
    - Her bir durum için ayrı işlem yapma.

 3. **Iterating Over Enumeration Cases:**
    - `CaseIterable` protokolü ile tüm enum durumları üzerinde döngü oluşturma.

 4. **Associated Values:**
    - Enum durumlarına ilişkilendirilmiş ek veriler (`associated values`) ekleme.
    - İlişkili değerlerin `switch` ile işlenmesi.

 5. **Raw Values:**
    - Enum durumlarına ham değer (`raw value`) atama.
    - Ham değerlerin kullanılabilirliği ve alınması.

 6. **Implicitly Assigned Raw Values:**
    - Ham değerlerin otomatik olarak atanması (örneğin, `Int` için artan sırada değerler).

 7. **Initializing from a Raw Value:**
    - Ham değerlerden enum durumlarına dönüşüm (`rawValue`).

 8. **Recursive Enumerations:**
    - `indirect` anahtar kelimesi ile kendi içinde referans veren enum'lar.
    - Örnek: Matematiksel ifadeleri değerlendirme (`evaluate` fonksiyonu).

 Bu kod, enumerations kullanarak sabitler ve ilişkili değerler arasında nasıl yapılandırma yapılacağını gösterir.
 Ayrıca, recursive yapıların ve ham değerlerin kullanımını anlamak için güçlü bir temeldir.
*/