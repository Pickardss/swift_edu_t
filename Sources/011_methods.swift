func runMethodsExamples() {
    // ==================================================
    // INSTANCE METHODS
    // ==================================================
    struct Counter {
        var count = 0
        
        func displayCount() {
            print("Current count: \(count)") // Örnek metot, mevcut sayıyı gösterir
        }

        mutating func increment() {
            count += 1 // Değer türü olduğu için mutating gerekiyor
        }

        mutating func reset() {
            count = 0
        }
    }
    var counter = Counter()
    counter.increment() // Sayacı bir artırır
    counter.displayCount() // Güncel sayıyı gösterir
    counter.reset() // Sayacı sıfırlar
    counter.displayCount()

    // ==================================================
    // THE SELF PROPERTY
    // ==================================================
    struct Point {
        var x = 0.0
        var y = 0.0

        func isToTheRight(of x: Double) -> Bool {
            return self.x > x // self ile özelliği referans eder
        }

        mutating func moveBy(x deltaX: Double, y deltaY: Double) {
            self.x += deltaX // self ile özelliği değiştirir
            self.y += deltaY
        }
    }
    var somePoint = Point(x: 4.0, y: 5.0)
    if somePoint.isToTheRight(of: 1.0) {
        print("The point is to the right of x = 1.0")
    }
    somePoint.moveBy(x: 2.0, y: 3.0)
    print("The point is now at (\(somePoint.x), \(somePoint.y))")

    // ==================================================
    // MODIFYING VALUE TYPES FROM WITHIN INSTANCE METHODS
    // ==================================================
    struct Size {
        var width = 0.0
        var height = 0.0

        mutating func increase(by factor: Double) {
            width *= factor // Mutating ile değer türü değiştirilebilir
            height *= factor
        }
    }
    var rectangleSize = Size(width: 5.0, height: 10.0)
    rectangleSize.increase(by: 2.0)
    print("New size: \(rectangleSize.width) x \(rectangleSize.height)")

    // ==================================================
    // ASSIGNING TO SELF WITHIN A MUTATING METHOD
    // ==================================================
    struct Vector {
        var x = 0.0
        var y = 0.0

        mutating func resetToZero() {
            self = Vector(x: 0.0, y: 0.0) // self'in tamamına yeni bir değer atanır
        }
    }
    var vector = Vector(x: 3.0, y: 4.0)
    vector.resetToZero()
    print("Vector after reset: (\(vector.x), \(vector.y))")

    // ==================================================
    // TYPE METHODS
    // ==================================================
    struct MathUtility {
        static func square(_ value: Double) -> Double {
            return value * value // Bir sayının karesini hesaplar
        }

        static func cube(_ value: Double) -> Double {
            return value * value * value // Bir sayının küpünü hesaplar
        }
    }
    let squareOfFour = MathUtility.square(4.0)
    let cubeOfThree = MathUtility.cube(3.0)
    print("Square of 4: \(squareOfFour)")
    print("Cube of 3: \(cubeOfThree)")
}

/*
SUMMARY:
Bu kod, Swift'te metodların nasıl tanımlandığını ve kullanıldığını göstermektedir:

1. **Instance Methods:**
   - Bir sınıf veya yapıdaki özelliklere erişim sağlayan ve işlemleri gerçekleştiren yöntemlerdir.
   - Örneğin, `Counter` yapısındaki `increment`, `reset`, ve `displayCount` metotları sayaç üzerinde işlemler yapar.

2. **The Self Property:**
   - `self`, mevcut örneğin kendisini ifade eder.
   - `Point` yapısında `self` ile özelliklere erişilir ve güncellenir. Örneğin, `isToTheRight` metodu, bir noktanın belirli bir x değerinin sağında olup olmadığını kontrol eder.

3. **Modifying Value Types from Within Instance Methods:**
   - Değer türlerini (`struct`) içeren metotlar, değişiklik yapmak için `mutating` anahtar sözcüğünü kullanır.
   - `Size` yapısındaki `increase` metodu, genişlik ve yüksekliği bir çarpanla artırır.

4. **Assigning to Self Within a Mutating Method:**
   - `self` tüm yapıya yeni bir değer atamak için kullanılabilir.
   - `Vector` yapısındaki `resetToZero` metodu, `self`'i sıfır noktasına ayarlar.

5. **Type Methods:**
   - Türle ilişkili olan ve doğrudan sınıf veya yapı üzerinden çağrılan metotlardır (`static`).
   - `MathUtility` yapısındaki `square` ve `cube` metotları, bir sayının karesini veya küpünü hesaplar.

Bu örnekler, Swift'te instance ve type metotlarının yanı sıra `self` kullanımını ve değer türlerini nasıl değiştirileceğini göstermektedir.
*/