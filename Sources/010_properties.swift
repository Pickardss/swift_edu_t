func runPropertiesExamples() {
    // ==================================================
    // STORED PROPERTIES
    // ==================================================
    struct FixedLengthRange {
        var firstValue: Int // Depolanan özellik
        let length: Int // Değiştirilemeyen sabit bir özellik
    }
    let range = FixedLengthRange(firstValue: 0, length: 3) // 'let' ile sabitlendi
    print("Range: \(range.firstValue)...\(range.firstValue + range.length)")

    // ==================================================
    // TYPE PROPERTIES
    // ==================================================
    struct SomeStruct {
        static let storedTypeProperty = "Some Value" // Sabit tip özelliği
        static var computedTypeProperty: Int { // Hesaplanan tip özelliği
            return 42
        }
    }

    // Sabit tip özelliklere erişim ve sorgulama
    print("Stored Type Property: \(SomeStruct.storedTypeProperty)")
    print("Computed Type Property: \(SomeStruct.computedTypeProperty)")

    // ==================================================
    // COMPUTED PROPERTIES
    // ==================================================
    struct Rectangle {
        var width = 0.0 // Depolanan genişlik özelliği
        var height = 0.0 // Depolanan yükseklik özelliği
        var area: Double { // Hesaplanan özellik
            return width * height
        }
    }
    let rect = Rectangle(width: 5.0, height: 10.0)
    print("Rectangle Area: \(rect.area)") // Dikdörtgenin alanı hesaplanır

    // ==================================================
    // PROPERTY WRAPPERS
    // ==================================================
    @propertyWrapper
    struct ClampedValue {
        private var value: Int
        private let range: ClosedRange<Int>

        init(wrappedValue: Int, range: ClosedRange<Int>) {
            // Değer aralıktaysa atanır, değilse alt sınıra ayarlanır
            self.value = range.contains(wrappedValue) ? wrappedValue : range.lowerBound
            self.range = range
        }

        var wrappedValue: Int {
            get { value }
            set { value = range.contains(newValue) ? newValue : value } // Değer aralık dışındaysa önceki değeri korur
        }
    }

    struct Game {
        @ClampedValue(range: 0...10) var score: Int = 5 // Belirli bir aralığı zorunlu kılar
    }

    var game = Game()
    print("Initial Score: \(game.score)") // İlk skor
    game.score = 12 // Aralık dışı değer atanamaz
    print("Score After Update: \(game.score)") // Güncellenen skor

    // ==================================================
    // PROJECTING A VALUE FROM A PROPERTY WRAPPER
    // ==================================================
    @propertyWrapper
    struct Logger {
        private var value: Int
        var projectedValue: String { // Değerin yansıtılan hali
            return "Current value: \(value)"
        }

        init(wrappedValue: Int) {
            self.value = wrappedValue
        }

        var wrappedValue: Int {
            get { value }
            set { value = newValue }
        }
    }

    struct Settings {
        @Logger var level: Int = 0 // Özellik Logger ile sarılır
    }

    let settings = Settings()
    print(settings.$level) // Yansıtılan log bilgisi

    // ==================================================
    // GLOBAL AND LOCAL VARIABLES
    // ==================================================
    var globalVariable = 42 // Global değişken
    func modifyGlobal() {
        globalVariable += 1 // Global değişkeni günceller
    }
    modifyGlobal()
    print("Global Variable: \(globalVariable)") // Güncellenen global değişken
}

/*
SUMMARY:
Bu kod, Swift'te özelliklerin (properties) kullanımını ve farklı türlerini açıklamaktadır:

1. **Stored Properties:**
   - Yapı içinde tanımlanan sabit veya değişken özelliklerdir.
   - `FixedLengthRange` örneğiyle sabit (`let`) ve değiştirilebilir (`var`) özellikler gösterilmiştir.

2. **Type Properties:**
   - Bir türle ilişkilendirilmiş, tüm örneklerde paylaşılan özelliklerdir.
   - `storedTypeProperty` sabit bir özellik, `computedTypeProperty` hesaplanan bir özellik örneğidir.

3. **Computed Properties:**
   - Depolanmış bir değer yerine, bir değer hesaplayan özelliklerdir.
   - `Rectangle` örneği ile bir dikdörtgenin alanı hesaplanmıştır.

4. **Property Wrappers:**
   - Özelliklerin davranışlarını özelleştirmek için kullanılan sarmalayıcılar.
   - `ClampedValue` örneği, bir değeri belirli bir aralıkta tutmak için kullanılmıştır.
   - `Game` yapısında, `score` özelliği belirli bir aralığın dışına çıkamaz.

5. **Projecting a Value from a Property Wrapper:**
   - `Logger` özelliği, bir yansıtılan değer (`projectedValue`) ile sarılmıştır.
   - `Settings` yapısı, log bilgilerini göstermek için bu özelliği kullanır.

6. **Global and Local Variables:**
   - Global ve lokal değişkenler üzerinde işlem yapılabilir.
   - `modifyGlobal` fonksiyonu, bir global değişkeni güncelleyen bir örnek sunar.

Bu kod, özelliklerin nasıl tanımlandığını, kullanıldığını ve özelleştirilebileceğini göstermektedir. Property wrappers gibi gelişmiş kavramlar, özellik davranışlarını kontrol etmek için kullanılır.
*/