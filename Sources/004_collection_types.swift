func runCollectionTypes() {
    // ==================================================
    // MUTABILITY OF COLLECTIONS
    // ==================================================
    var mutableArray = [1, 2, 3] // Değiştirilebilir bir dizi
    mutableArray.append(4) // Yeni bir eleman eklendi
    print("Mutable Array: \(mutableArray)")

    let immutableArray = [1, 2, 3] // Değiştirilemez bir dizi
    print("Immutable Array: \(immutableArray)")

    // ==================================================
    // ARRAYS
    // ==================================================
    // Array Type Shorthand Syntax
    let shorthandArray: [Int] = [1, 2, 3]
    print("Shorthand Array: \(shorthandArray)")

    // Create an Empty Array
    let emptyArray: [String] = [] // Değişmeyeceği için 'let' ile tanımlandı
    print("Empty Array: \(emptyArray)")

    // Create an Array with a Default Value
    let defaultValueArray = Array(repeating: 0, count: 5)
    print("Default Value Array: \(defaultValueArray)")

    // Creating an Array by Adding Two Arrays Together
    let firstArray = [1, 2]
    let secondArray = [3, 4]
    let combinedArray = firstArray + secondArray
    print("Combined Array: \(combinedArray)")

    // Creating an Array with an Array Literal
    let literalArray = ["Apple", "Banana", "Cherry"]
    print("Array Literal: \(literalArray)")

    // Accessing and Modifying an Array
    var fruits = ["Apple", "Banana"]
    fruits.append("Cherry")
    fruits[1] = "Blueberry" // Eleman güncellendi
    print("Modified Array: \(fruits)")

    // Iterating Over an Array
    for fruit in fruits {
        print("Fruit: \(fruit)")
    }

    // ==================================================
    // SETS
    // ==================================================
    // Hash Values for Set Types
    // Set elemanlarının benzersiz olması için hash değerleri kullanılır.

    // Set Type Syntax
    var integerSet: Set<Int> = [1, 2, 3]
    print("Integer Set: \(integerSet)")

    // Creating and Initializing an Empty Set
    let emptySet = Set<String>() // Değişmeyeceği için 'let' ile tanımlandı
    print("Empty Set: \(emptySet)")

    // Creating a Set with an Array Literal
    let literalSet: Set = ["Apple", "Banana", "Cherry"]
    print("Set Literal: \(literalSet)")

    // Accessing and Modifying a Set
    integerSet.insert(4)
    integerSet.remove(2)
    print("Modified Set: \(integerSet)")

    // Iterating Over a Set
    for item in literalSet {
        print("Set Item: \(item)")
    }

    // Performing Set Operations (Fundamental Set Operations)
    let setA: Set = [1, 2, 3]
    let setB: Set = [3, 4, 5]
    print("Union: \(setA.union(setB))") // Birleşim
    print("Intersection: \(setA.intersection(setB))") // Kesişim
    print("Difference: \(setA.subtracting(setB))") // Fark

    // Set Membership and Equality
    let isSubset = setA.isSubset(of: setB)
    print("Is Subset: \(isSubset)")

    // ==================================================
    // DICTIONARIES
    // ==================================================
    // Dictionary Type Shorthand Syntax
    let shorthandDictionary: [String: Int] = [:] // Değişmeyeceği için 'let' ile tanımlandı
    print("Shorthand Dictionary: \(shorthandDictionary)")

    // Creating an Empty Dictionary
    let emptyDictionary = [Int: String]() // Değişmeyeceği için 'let' ile tanımlandı
    print("Empty Dictionary: \(emptyDictionary)")

    // Creating a Dictionary with a Dictionary Literal
    var literalDictionary = ["Apple": 1, "Banana": 2, "Cherry": 3]
    print("Dictionary Literal: \(literalDictionary)")

    // Accessing and Modifying a Dictionary
    literalDictionary["Apple"] = 10 // Değer güncellendi
    literalDictionary["Orange"] = 4 // Yeni eleman eklendi
    print("Modified Dictionary: \(literalDictionary)")

    // Iterating Over a Dictionary
    for (key, value) in literalDictionary {
        print("Key: \(key), Value: \(value)")
    }
}