func runFunctionsExamples() {
    // ==================================================
    // DEFINING AND CALLING FUNCTIONS
    // ==================================================
    func sayHello() {
        print("Hello!") // Parametresiz bir fonksiyon
    }
    sayHello() // Fonksiyonu çağırır

    // ==================================================
    // FUNCTION PARAMETERS AND RETURN VALUES
    // ==================================================
    // Function Without Parameters
    func greet() -> String {
        return "Hello, World!" // Parametre almayan ve değer dönen bir fonksiyon
    }
    print(greet())

    // Function With Multiple Parameters
    func addTwoNumbers(_ a: Int, _ b: Int) -> Int {
        return a + b // İki parametre alıp toplamını döner
    }
    print("Sum: \(addTwoNumbers(5, 10))")

    // Function Without Return Values
    func displayMessage(_ message: String) {
        print("Message: \(message)") // Değer döndürmeyen bir fonksiyon
    }
    displayMessage("Swift is awesome!")

    // Functions With Multiple Return Values
    func calculateDimensions() -> (width: Int, height: Int) {
        return (10, 20) // Bir tuple döner
    }
    let dimensions = calculateDimensions()
    print("Width: \(dimensions.width), Height: \(dimensions.height)")

    // ==================================================
    // OPTIONAL TUPLE RETURN TYPES
    // ==================================================
    func findMinAndMax(_ numbers: [Int]) -> (min: Int, max: Int)? {
        guard let min = numbers.min(), let max = numbers.max() else {
            return nil // Eğer dizi boşsa nil döner
        }
        return (min, max) // Minimum ve maksimum değerleri döner
    }
    if let result = findMinAndMax([1, 2, 3, 4, 5]) {
        print("Min: \(result.min), Max: \(result.max)")
    }

    // Function With Implicit Return
    func square(_ x: Int) -> Int { x * x } // Tek satırlık fonksiyonlar için return yazılmaz
    print("Square: \(square(4))")

    // Function Argument Labels and Parameter Names
    func greet(person name: String) {
        print("Hello, \(name)!")
    }
    greet(person: "Turhan") // Etiketle çağırma

    // Omitting Argument Labels
    func multiply(_ a: Int, _ b: Int) -> Int {
        return a * b // Etiket olmadan parametre kullanımı
    }
    print("Multiplication: \(multiply(4, 5))")

    // Default Parameter Values
    func increment(_ number: Int, by amount: Int = 1) -> Int {
        return number + amount // Varsayılan parametre kullanımı
    }
    print("Incremented: \(increment(10))") // Varsayılan değer kullanılır

    // Variadic Parameters
    func calculateSum(_ numbers: Int...) -> Int {
        return numbers.reduce(0, +) // Birden fazla parametre kabul eder
    }
    print("Sum: \(calculateSum(1, 2, 3, 4, 5))")

    // In-Out Parameters
    func swapValues(_ a: inout Int, _ b: inout Int) {
        let temp = a
        a = b
        b = temp // Değerleri değiştirir
    }
    var first = 10, second = 20
    swapValues(&first, &second)
    print("First: \(first), Second: \(second)")

    // ==================================================
    // FUNCTION TYPES
    // ==================================================
    // Using Function Types
    func add(_ a: Int, _ b: Int) -> Int { a + b }
    let operation: (Int, Int) -> Int = add // Fonksiyon türüyle değişken tanımlama
    print("Operation Result: \(operation(3, 4))")

    // Function Types as Parameter Types
    func performOperation(_ a: Int, _ b: Int, using operation: (Int, Int) -> Int) -> Int {
        return operation(a, b) // Fonksiyon türünü parametre olarak alır
    }
    print("Operation: \(performOperation(5, 7, using: add))")

    // Function Types as Return Types
    func chooseOperation(_ isAddition: Bool) -> (Int, Int) -> Int {
        return isAddition ? add : multiply // Fonksiyon döndürür
    }
    let chosenOperation = chooseOperation(true)
    print("Chosen Operation: \(chosenOperation(6, 3))")

    // ==================================================
    // NESTED FUNCTIONS
    // ==================================================
    func outerFunction() -> () -> String {
        func innerFunction() -> String {
            return "Hello from the inner function!" // İç içe fonksiyon
        }
        return innerFunction
    }
    let inner = outerFunction()
    print(inner()) // İç fonksiyonu çağırır
}

/*
 SUMMARY:
 Bu kod, Swift'te fonksiyonların nasıl tanımlanacağını, çağrılacağını ve kullanılacağını kapsamlı bir şekilde açıklar:

 1. **Defining and Calling Functions:** 
    - Parametresiz, parametreli ve değer döndüren fonksiyon örnekleri.
    - Fonksiyonların temel çağrılma yöntemleri.

 2. **Function Parameters and Return Values:** 
    - Çoklu parametre kabul eden fonksiyonlar.
    - Değer döndüren ve döndürmeyen fonksiyonlar.
    - Tuple kullanarak çoklu değer döndüren fonksiyonlar.

 3. **Optional Tuple Return Types:** 
    - Fonksiyonun opsiyonel tuple döndürmesi.
    - `guard` kullanarak güvenli bir şekilde minimum ve maksimum değer hesaplama.

 4. **Implicit Return:**
    - Tek satırlık fonksiyonlarda `return` anahtar kelimesinin atlanması.

 5. **Function Argument Labels and Parameter Names:**
    - Parametre etiketleri ve isimlerinin kullanımı.
    - Parametre etiketlerinin atlanması.

 6. **Default Parameter Values:**
    - Varsayılan parametre değerleri.

 7. **Variadic Parameters:**
    - Değişken sayıda parametre kabul eden fonksiyonlar (`Int...`).

 8. **In-Out Parameters:**
    - `inout` anahtar kelimesiyle fonksiyonların çağıranın değerlerini değiştirme.

 9. **Function Types:**
    - Fonksiyon türlerini değişken olarak tanımlama.
    - Fonksiyon türlerini parametre veya dönüş tipi olarak kullanma.

 10. **Nested Functions:**
    - Fonksiyon içinde fonksiyon tanımlama ve dış fonksiyona döndürme.

 Bu kod, Swift'te fonksiyonların esnekliğini ve güçlü özelliklerini anlamak için harika bir rehberdir. 
 Fonksiyon türleri, parametreler ve iç içe yapılandırmalar gibi çeşitli kullanım senaryolarını kapsar.
*/