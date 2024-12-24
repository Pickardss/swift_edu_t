func runControlFlowExamples() {
    // ==================================================
    // FOR-IN LOOPS
    // ==================================================
    let numbers = [1, 2, 3, 4, 5]
    for number in numbers {
        print("Number: \(number)") // Dizi elemanları üzerinde dönülür
    }

    let animalLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
    for (animal, legs) in animalLegs {
        print("\(animal) has \(legs) legs") // Sözlük elemanları üzerinde dönülür
    }

    // ==================================================
    // WHILE LOOPS
    // ==================================================
    var countdown = 5
    while countdown > 0 {
        print("Countdown: \(countdown)") // Şart sağlandıkça döngü çalışır
        countdown -= 1
    }

    var repeatCountdown = 3
    repeat {
        print("Repeat Countdown: \(repeatCountdown)") // Döngü en az bir kez çalışır
        repeatCountdown -= 1
    } while repeatCountdown > 0

    // ==================================================
    // CONDITIONAL STATEMENTS
    // ==================================================
    let temperature = 30
    if temperature > 25 {
        print("It's a hot day.") // Şart sağlanırsa bu blok çalışır
    } else {
        print("It's a cool day.") // Şart sağlanmazsa bu blok çalışır
    }

    let character = "a"
    switch character {
    case "a":
        print("It's the first letter of the alphabet.") // Case eşleşirse bu blok çalışır
    case "z":
        print("It's the last letter of the alphabet.")
    default:
        print("It's another character.") // Hiçbir case eşleşmezse bu blok çalışır
    }

    // ==================================================
    // NO IMPLICIT FALLTHROUGH
    // ==================================================
    let number = 2
    switch number {
    case 1:
        print("One")
    case 2:
        print("Two") // Bu case'den sonra diğer case'lere geçiş yapılmaz
    default:
        print("Other number")
    }

    // ==================================================
    // INTERVAL MATCHING
    // ==================================================
    let score = 85
    switch score {
    case 0..<50:
        print("Failed") // Aralık eşleşirse bu blok çalışır
    case 50..<90:
        print("Passed")
    case 90...100:
        print("Excellent")
    default:
        print("Invalid score")
    }

    // ==================================================
    // TUPLES
    // ==================================================
    let point = (2, 0)
    switch point {
    case (0, 0):
        print("Point is at the origin") // Nokta orijindeyse çalışır
    case (_, 0):
        print("Point is on the x-axis") // Y değeri 0 ise çalışır
    case (0, _):
        print("Point is on the y-axis") // X değeri 0 ise çalışır
    case (-2...2, -2...2):
        print("Point is within the grid") // Belirtilen aralıktaysa çalışır
    default:
        print("Point is outside the grid")
    }

    // ==================================================
    // VALUE BINDINGS
    // ==================================================
    let anotherPoint = (3, 4)
    switch anotherPoint {
    case (let x, 0):
        print("On x-axis at \(x)") // x ekseninde bir nokta
    case (0, let y):
        print("On y-axis at \(y)") // y ekseninde bir nokta
    case let (x, y):
        print("At (\(x), \(y))") // Genel durum
    }

    // ==================================================
    // WHERE
    // ==================================================
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:
        print("Point is on the diagonal") // x ve y eşitse çalışır
    case let (x, y) where x == -y:
        print("Point is on the anti-diagonal") // x ve y birbirinin negatifi ise çalışır
    default:
        print("Point is at (\(yetAnotherPoint.0), \(yetAnotherPoint.1))") // Koordinatların çıktısı
    }

    // ==================================================
    // COMPOUND CASES
    // ==================================================
    let anotherCharacter = "e"
    switch anotherCharacter {
    case "a", "e", "i", "o", "u":
        print("It's a vowel.") // Sesli harfler için geçerli
    default:
        print("It's a consonant.") // Sessiz harfler için geçerli
    }

    // ==================================================
    // CONTROL TRANSFER STATEMENTS
    // ==================================================

    // Continue
    for number in 1...10 {
        if number % 2 == 0 {
            continue // Çift sayıları atlar
        }
        print("Odd number: \(number)")
    }

    // Break
    for number in 1...10 {
        if number == 5 {
            break // Döngüyü sonlandırır
        }
        print("Number before break: \(number)")
    }

    // Fallthrough
    let someNumber = 2
    switch someNumber {
    case 1:
        print("One")
    case 2:
        print("Two")
        fallthrough // Sonraki case'e geçiş yapar
    case 3:
        print("Three after fallthrough")
    default:
        break
    }

    // Labeled Statements
    outerLoop: for i in 1...3 {
        for j in 1...3 {
            if i == j {
                print("Breaking outer loop") // Dış döngüyü kırar
                break outerLoop
            }
        }
    }

    // Early Exit
    func greet(_ name: String?) {
        guard let name = name else {
            print("No name provided") // Şart sağlanmazsa döner
            return
        }
        print("Hello, \(name)!")
    }
    greet(nil)
    greet("Turhan")

    // Deferred Actions
    func fetchResource() {
        defer {
            print("Cleaning up resources") // İşlem sonunda çalışır
        }
        print("Fetching resources")
    }
    fetchResource()

    // Checking API Availability
    if #available(iOS 15, *) {
        print("Running on iOS 14 or newer") // iOS 15 ve üzeri için geçerli
    } else {
        print("Running on an older version of iOS") // Daha eski sürümler için geçerli
    }
}

/*
 SUMMARY:
 Bu kod, Swift'teki kontrol akışını yönetmek için kullanılan çeşitli mekanizmaları kapsamlı bir şekilde ele alır:
 
 1. **For-In Loops:** Diziler, sözlükler ve aralıklar (`Range`) üzerinde döngüyle gezinme.
 2. **While Loops:** Şart sağlandıkça döngüyü çalıştırma (`while`) ve en az bir kez çalıştırma (`repeat-while`).
 3. **Conditional Statements:** `if-else` ve `switch` ile koşullu ifadeleri kontrol etme.
 4. **No Implicit Fallthrough:** `switch` yapısında case'ler arasında otomatik geçişin olmaması.
 5. **Interval Matching:** `switch` ile belirli aralıklar (`..<` ve `...`) üzerinde kontrol.
 6. **Tuples:** `switch` içinde tuple'lar kullanarak birden fazla değeri eşleştirme.
 7. **Value Bindings:** `switch` ile değişkenleri bağlama (örneğin, `(let x, let y)`).
 8. **Where:** `where` anahtar kelimesiyle ek şartlar ekleme.
 9. **Compound Cases:** Birden fazla değeri aynı case altında gruplama.
 10. **Control Transfer Statements:**
     - **Continue:** Döngünün bir sonraki iterasyona geçmesini sağlar.
     - **Break:** Döngüyü tamamen sonlandırır.
     - **Fallthrough:** `switch` yapısında bir sonraki case'e geçiş yapar.
     - **Labeled Statements:** Döngüleri etiketleyerek dıştaki döngüyü sonlandırma.
 11. **Early Exit:** `guard` ile şart sağlanmadığında erken çıkış yapma.
 12. **Deferred Actions:** `defer` ile bir işlem tamamlandıktan sonra çalışacak kodları belirleme.
 13. **Checking API Availability:** `#available` ile belirli bir platform veya sürümde çalışacak kodları kontrol etme.

 Bu kod, Swift'teki döngüler, şartlı ifadeler ve kontrol mekanizmalarını anlamak için güçlü bir temeldir.
*/