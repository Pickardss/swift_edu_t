func runInitializationExamples() {
    // ==================================================
    // SETTING INITIAL VALUES FOR STORED PROPERTIES
    // ==================================================
    struct FixedLengthRange {
        var start: Int
        var length: Int
    }
    let range = FixedLengthRange(start: 0, length: 5)
    print("Range: \(range.start)...\(range.start + range.length)")

    // ==================================================
    // INITIALIZERS
    // ==================================================
    class Person {
        var name: String
        var age: Int

        init(name: String, age: Int) {
            self.name = name
            self.age = age
        }
    }
    let person = Person(name: "Alice", age: 30)
    print("Person: \(person.name), Age: \(person.age)")

    // ==================================================
    // DEFAULT PROPERTY VALUES
    // ==================================================
    struct Celsius {
        var temperatureInCelsius: Double = 0.0 // Varsayılan değer atanır
    }
    let celsius = Celsius()
    print("Temperature: \(celsius.temperatureInCelsius)°C")

    // ==================================================
    // CUSTOMIZING INITIALIZATION
    // ==================================================
    struct Rectangle {
        var width: Double
        var height: Double

        init(width: Double, height: Double) {
            self.width = width
            self.height = height
        }

        init(side: Double) {
            self.width = side
            self.height = side
        }
    }
    let rectangle = Rectangle(width: 5.0, height: 10.0)
    let square = Rectangle(side: 4.0)
    print("Rectangle: \(rectangle.width)x\(rectangle.height)")
    print("Square: \(square.width)x\(square.height)")

    // ==================================================
    // INITIALIZER PARAMETERS
    // ==================================================
    struct Color {
        var red: Double
        var green: Double
        var blue: Double
    }
    let color = Color(red: 1.0, green: 0.5, blue: 0.0)
    print("Color: \(color.red), \(color.green), \(color.blue)")

    // ==================================================
    // OPTIONAL PROPERTY TYPES
    // ==================================================
    class SurveyQuestion {
        var text: String
        var response: String?

        init(text: String) {
            self.text = text
        }
    }
    let question = SurveyQuestion(text: "What is your favorite color?")
    print("Question: \(question.text), Response: \(question.response ?? "No response yet")")

    // ==================================================
    // CLASS INHERITANCE AND INITIALIZATION
    // ==================================================
    class Vehicle {
        var wheels: Int

        init(wheels: Int) {
            self.wheels = wheels
        }
    }

    class Car: Vehicle {
        var brand: String

        init(brand: String) {
            self.brand = brand
            super.init(wheels: 4) // Üst sınıfın initializer'ı çağrılır
        }
    }

    let car = Car(brand: "Toyota")
    print("Car: \(car.brand), Wheels: \(car.wheels)")

    // ==================================================
    // FAILABLE INITIALIZERS
    // ==================================================
    struct Animal {
        let species: String

        init?(species: String) {
            if species.isEmpty {
                return nil // Başarısız bir initializer
            }
            self.species = species
        }
    }
    if let dog = Animal(species: "Dog") {
        print("Animal species: \(dog.species)")
    } else {
        print("Initialization failed.")
    }

    if let unknown = Animal(species: "") {
        print("Animal species: \(unknown.species)")
    } else {
        print("Initialization failed.")
    }

    // ==================================================
    // REQUIRED INITIALIZERS
    // ==================================================
    class SomeClass {
        required init() {
            // Alt sınıflar bu initializer'ı uygulamak zorunda
        }
    }

    class SomeSubclass: SomeClass {
        required init() {
            // Alt sınıfın required initializer'ı
            super.init()
        }
    }

    // ==================================================
    // SETTING A DEFAULT PROPERTY VALUE WITH A CLOSURE
    // ==================================================
    struct BoardGame {
        var board: [[String]] = {
            var board = [[String]]()
            for _ in 0..<8 {
                board.append(Array(repeating: "-", count: 8))
            }
            return board
        }()
    }
    let chessBoard = BoardGame()
    print("Chess Board: \(chessBoard.board)")
}

/*
SUMMARY:
Bu kod, Swift'te nesnelerin ve yapıların nasıl başlatılacağını, varsayılan değerlerin atanmasını, farklı başlatıcı türlerini ve başarısız başlatıcıları açıklamaktadır.

1. **Setting Initial Values for Stored Properties:**
   - `FixedLengthRange` gibi yapıların başlatıcı olmadan nasıl başlatılacağını gösterir.

2. **Initializers:**
   - `Person` sınıfı gibi özel başlatıcılar (initializer) ile özelliklerin nasıl başlatılacağını açıklar.

3. **Default Property Values:**
   - Özelliklere varsayılan değerler atanabilir (`Celsius` örneği).

4. **Customizing Initialization:**
   - Birden fazla başlatıcı tanımlayarak (`Rectangle`) farklı başlatma yöntemleri sağlanabilir.

5. **Initializer Parameters:**
   - Parametrelerle özellik değerleri atanabilir (`Color` örneği).

6. **Optional Property Types:**
   - Başlangıçta değeri olmayabilecek özellikler tanımlanabilir (`SurveyQuestion` örneği).

7. **Class Inheritance and Initialization:**
   - Alt sınıfların, üst sınıfın başlatıcılarını nasıl çağıracağını gösterir (`Car` sınıfı).

8. **Failable Initializers:**
   - Başarısız olabilen başlatıcılar (`Animal` yapısı) tanımlanabilir. Örneğin, bir koşul sağlanmazsa nil dönebilir.

9. **Required Initializers:**
   - `required` anahtar kelimesiyle bir başlatıcının tüm alt sınıflar tarafından uygulanmasını zorunlu kılar.

10. **Setting a Default Property Value with a Closure:**
    - Özelliklerin başlangıç değerlerini dinamik olarak hesaplamak için closure kullanımı (`BoardGame` örneği).

Bu örnekler, Swift'in başlatıcı mekanizmasını ve nesnelerin ilk durumlarının nasıl yapılandırıldığını anlamak için önemli kavramları kapsamaktadır.
*/