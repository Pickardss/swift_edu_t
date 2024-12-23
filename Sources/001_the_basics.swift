func runTheBasics() {
    // ==================================================
    // CONSTANTS AND VARIABLES
    // ==================================================
    let constantValue = 10 // Sabit bir değer, değiştirilemez
    var variableValue = 20 // Değiştirilebilir bir değer
    variableValue = 30 // variableValue'nun değeri değiştirildi
    print("Constant: \(constantValue), Variable: \(variableValue)")

    // ==================================================
    // TYPE ANNOTATIONS
    // ==================================================
    let explicitString: String = "Hello, Swift!" // Türü açıkça belirtilmiş String
    var explicitInteger: Int = 42 // Türü açıkça belirtilmiş tam sayı
    explicitInteger += 1 // explicitInteger'ın değeri artırıldı
    print("Explicit String: \(explicitString), Explicit Integer: \(explicitInteger)")

    // ==================================================
    // NAMING CONSTANTS AND VARIABLES
    // ==================================================
    let π = 3.14159 // Sabit bir sayı
    var 🐶 = "Dog" // Değişken adı emoji olabilir
    🐶 = "Cat" // Değeri değiştirildi
    print("π: \(π), Emoji Variable: \(🐶)")

    // ==================================================
    // PRINTING CONSTANTS AND VARIABLES
    // ==================================================
    print("The value of π is \(π) and the emoji variable contains \(🐶)")

    // ==================================================
    // SEMICOLONS
    // ==================================================
    let a = 5; var b = 10; b += 5; print(a + b) // Aynı satırda noktalı virgül ile birden fazla ifade yazılabilir

    // ==================================================
    // INTEGERS
    // ==================================================
    let intExample: Int = -42 // Negatif bir tam sayı
    var uintExample: UInt = 42 // Pozitif tam sayı (Unsigned Integer)
    uintExample += 1 // uintExample'ın değeri artırıldı
    print("Integer: \(intExample), Unsigned Integer: \(uintExample)")

    // ==================================================
    // FLOATING-POINT NUMBERS
    // ==================================================
    let doubleExample: Double = 3.14159 // Çift hassasiyetli ondalıklı sayı
    var floatExample: Float = 2.71828 // Tek hassasiyetli ondalıklı sayı
    floatExample += 1.0 // floatExample'ın değeri artırıldı
    print("Double: \(doubleExample), Float: \(floatExample)")

    // ==================================================
    // TYPE SAFETY AND TYPE INFERENCE
    // ==================================================
    let inferredString = "This is a string" // Türü otomatik olarak String olarak belirlendi
    var inferredInt = 42 // Türü otomatik olarak Int olarak belirlendi
    inferredInt *= 2 // inferredInt'in değeri çarpıldı
    print("Inferred String: \(inferredString), Inferred Int: \(inferredInt)")

    // ==================================================
    // NUMERIC LITERALS
    // ==================================================
    let decimalInteger = 17 // Ondalık sayı sistemi
    var binaryInteger = 0b10001 // İkili sayı sistemi
    binaryInteger += 1 // binaryInteger'ın değeri artırıldı
    print("Decimal: \(decimalInteger), Binary: \(binaryInteger)")

    // ==================================================
    // NUMERIC TYPE CONVERSION
    // ==================================================
    let smallNumber: UInt8 = 255 // 8 bitlik bir unsigned integer
    var convertedNumber = UInt16(smallNumber) // 16 bitlik unsigned integer'a dönüştürüldü
    convertedNumber += 10
    print("Converted Number: \(convertedNumber)")

    // ==================================================
    // TYPE ALIASES
    // ==================================================
    typealias AudioSample = UInt16 // Yeni bir tür ismi oluşturuldu
    var sampleValue: AudioSample = 0 // Yeni isimle değişken tanımlandı
    sampleValue = 1024
    print("Audio Sample Value: \(sampleValue)")

    // ==================================================
    // BOOLEANS
    // ==================================================
    var isSwiftFun = true // Boolean bir değişken
    isSwiftFun = false // Değeri değiştirildi
    print("Is Swift Fun? \(isSwiftFun)")

    // ==================================================
    // TUPLES
    // ==================================================
    var httpError = (404, "Not Found") // Bir tuple tanımlandı
    httpError.1 = "Page Not Found" // Tuple içindeki bir değer değiştirildi
    print("Status Code: \(httpError.0), Message: \(httpError.1)")

    // ==================================================
    // OPTIONALS
    // ==================================================
    var optionalString: String? = "Hello" // Optional bir String
    optionalString = nil // Optional nil olabilir
    let fallbackValue = optionalString ?? "Default Value" // Varsayılan bir değer verildi
    print("Fallback Value: \(fallbackValue)")

    // ==================================================
    // FORCED UNWRAPPING
    // ==================================================
    optionalString = "Forced Unwrapping!" // Optional değeri atandı
    print("Forced Unwrap: \(optionalString!)") // Forced unwrap ile içeriği alındı

    // ==================================================
    // IMPLICITLY UNWRAPPED OPTIONALS
    // ==================================================
    var implicitlyUnwrappedString: String! = "Implicitly Unwrapped" // Varsayılan unwrap yapılabilir
    implicitlyUnwrappedString = "Updated Implicitly Unwrapped" // Değeri değiştirildi
    print("Implicitly Unwrapped: \(String(describing: implicitlyUnwrappedString))") // String(describing:) ile bastırıldı

    // ==================================================
    // ERROR HANDLING
    // ==================================================
    enum PrinterError: Error {
        case outOfPaper
        case noToner
    }

    func printDocument() throws {
        throw PrinterError.outOfPaper // Hata fırlatıldı
    }

    do {
        try printDocument() // Hata yakalamaya çalışıldı
    } catch {
        print("Error: \(error)") // Hata yakalandı ve yazdırıldı
    }

    // ==================================================
    // ASSERTIONS AND PRECONDITIONS
    // ==================================================
    let age = 3 // Yaş değişkeni
    assert(age >= 0, "Age cannot be negative!") // Debug sırasında kontrol için assert kullanıldı
    precondition(age >= 0, "Age must be non-negative.") // Üretim sırasında kontrol için precondition kullanıldı
}