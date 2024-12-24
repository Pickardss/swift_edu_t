func runSubscriptsExamples() {
    // ==================================================
    // SUBSCRIPT SYNTAX
    // ==================================================
    struct TimesTable {
        let multiplier: Int

        subscript(index: Int) -> Int {
            return multiplier * index // Subscript ile çarpım tablosu oluşturulur
        }
    }
    let threeTimesTable = TimesTable(multiplier: 3)
    print("3 x 6 = \(threeTimesTable[6])") // Subscript kullanımı

    // ==================================================
    // SUBSCRIPT USAGE
    // ==================================================
    struct Matrix {
        let rows: Int
        let columns: Int
        var grid: [Double]

        init(rows: Int, columns: Int) {
            self.rows = rows
            self.columns = columns
            self.grid = Array(repeating: 0.0, count: rows * columns) // Matris oluşturulur
        }

        func indexIsValid(row: Int, column: Int) -> Bool {
            return row >= 0 && row < rows && column >= 0 && column < columns
        }

        subscript(row: Int, column: Int) -> Double {
            get {
                assert(indexIsValid(row: row, column: column), "Index out of range") // Geçerli aralık kontrolü
                return grid[(row * columns) + column]
            }
            set {
                assert(indexIsValid(row: row, column: column), "Index out of range")
                grid[(row * columns) + column] = newValue
            }
        }
    }

    var matrix = Matrix(rows: 2, columns: 2)
    matrix[0, 1] = 1.5 // Subscript ile değer atanır
    matrix[1, 0] = 3.2
    print("Matrix Value at (0, 1): \(matrix[0, 1])") // Subscript ile değer okunur
    print("Matrix Value at (1, 0): \(matrix[1, 0])")

    // ==================================================
    // SUBSCRIPT OPTIONS
    // ==================================================
    struct Cuboid {
        var width = 0.0
        var height = 0.0
        var depth = 0.0

        subscript(dimension: String) -> Double? {
            switch dimension {
            case "width":
                return width
            case "height":
                return height
            case "depth":
                return depth
            default:
                return nil // Geçersiz bir boyut sorgulanırsa nil döner
            }
        }
    }
    let cuboid = Cuboid(width: 4.0, height: 5.0, depth: 6.0)
    print("Width: \(cuboid["width"] ?? 0.0)") // Geçerli bir boyut
    print("Invalid Dimension: \(cuboid["weight"] ?? 0.0)") // Geçersiz bir boyut

    // ==================================================
    // TYPE SUBSCRIPTS
    // ==================================================
    enum DaysOfWeek: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday

        static subscript(index: Int) -> DaysOfWeek? {
            return DaysOfWeek(rawValue: index) // Raw value ile subscripting
        }
    }
    if let day = DaysOfWeek[3] { // Subscript ile enum değerine erişim
        print("Day 3 is \(day).")
    } else {
        print("Invalid day index.")
    }
}

/*
SUMMARY:
Bu kod, Swift'teki `subscript` kullanımını ve farklı senaryolarda nasıl uygulanabileceğini göstermektedir.

1. **Subscript Syntax:**
   - `TimesTable` yapısı, bir çarpım tablosu oluşturmak için subscript kullanır.
   - Örneğin, `threeTimesTable[6]`, 3 ile 6'nın çarpımını döndürür.

2. **Subscript Usage:**
   - `Matrix` yapısı, iki boyutlu bir matris oluşturur ve subscript ile hücrelere erişim sağlar.
   - `matrix[0, 1]` ile matrisin belirli bir hücresine değer atanabilir veya okunabilir.
   - Geçersiz indeksler için bir `assert` ile hata mesajı verir.

3. **Subscript Options:**
   - `Cuboid` yapısı, alt küplerin genişlik, yükseklik veya derinliğine string-based subscript ile erişim sağlar.
   - Geçersiz bir boyut sorgulanırsa `nil` döndürür.

4. **Type Subscripts:**
   - `DaysOfWeek` enum'u, bir raw value'ye dayalı subscript ile belirli bir günü döndürür.
   - `DaysOfWeek[3]`, üçüncü günü (`tuesday`) döndürür. Geçersiz bir indeks `nil` döndürür.

Bu örnekler, subscript kullanarak yapıların, enum'ların ve diğer veri türlerinin nasıl daha erişilebilir ve esnek hale getirilebileceğini açıkça göstermektedir.
*/