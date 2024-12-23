func runStringsAndCharacters() {
    // ==================================================
    // STRING LITERALS
    // ==================================================
    let simpleString = "Hello, Swift!" // String literal
    print("String Literal: \(simpleString)")

    // ==================================================
    // MULTILINE STRING LITERALS
    // ==================================================
    let multilineString = """
    Bu,
    birden fazla
    satırlık bir string.
    """
    print("Multiline String: \(multilineString)")

    // ==================================================
    // SPECIAL CHARACTERS IN STRING LITERALS
    // ==================================================
    let specialCharacters = "Bu bir \"özel\" karakterdir.\nYeni satır burada başlar."
    print("Special Characters: \(specialCharacters)")

    // ==================================================
    // EXTENDED STRING DELIMITERS
    // ==================================================
    let extendedString = #"Bu bir özel karakterdir: \"Güvenli\""#
    print("Extended String Delimiters: \(extendedString)")

    // ==================================================
    // INITIALIZING AN EMPTY STRING
    // ==================================================
    let emptyString = "" // Boş bir string, değişmeyeceği için 'let' ile tanımlandı
    let anotherEmptyString = String() // Başka bir boş string, 'let' ile tanımlandı
    print("Empty String: '\(emptyString)' and '\(anotherEmptyString)'")

    // ==================================================
    // STRING MUTABILITY
    // ==================================================
    var mutableString = "Swift"
    mutableString += " is fun!" // Değiştirilebilir string
    print("Mutable String: \(mutableString)")

    // ==================================================
    // STRINGS ARE VALUE TYPES
    // ==================================================
    let originalString = "Original" // Değeri değişmeyecek, bu yüzden 'let' kullanıldı
    var copiedString = originalString // copiedString değiştirilecek, bu yüzden 'var' kullanıldı
    copiedString += " Modified" // copiedString'in değeri değiştirildi
    print("Original String: \(originalString), Copied String: \(copiedString)")

    // ==================================================
    // WORKING WITH CHARACTERS
    // ==================================================
    for character in "Swift" {
        print("Character: \(character)")
    }

    // ==================================================
    // CONCATENATING STRINGS AND CHARACTERS
    // ==================================================
    let greeting = "Hello"
    let world = " World"
    let exclamation: Character = "!"
    let fullGreeting = greeting + world + String(exclamation)
    print("Concatenated String: \(fullGreeting)")

    // ==================================================
    // STRING INTERPOLATION
    // ==================================================
    let interpolation = "2 + 2 = \(2 + 2)"
    print("String Interpolation: \(interpolation)")

    // ==================================================
    // UNICODE
    // ==================================================
    let unicodeString = "🌍🌎🌏"
    print("Unicode String: \(unicodeString)")

    // ==================================================
    // UNICODE SCALAR VALUES
    // ==================================================
    for scalar in "Swift".unicodeScalars {
        print("Unicode Scalar: \(scalar.value)")
    }

    // ==================================================
    // EXTENDED GRAPHEME CLUSTERS
    // ==================================================
    let eAcute: Character = "\u{E9}" // é
    let combinedEAcute: Character = "\u{65}\u{301}" // e + ´
    print("Extended Grapheme Cluster: \(eAcute), \(combinedEAcute)")

    // ==================================================
    // COUNTING CHARACTERS
    // ==================================================
    let countString = "Swift"
    print("Character Count: \(countString.count)")

    // ==================================================
    // ACCESSING AND MODIFYING A STRING
    // ==================================================
    var modifyString = "Hello"
    modifyString.insert("!", at: modifyString.endIndex)
    print("Modified String: \(modifyString)")

    // ==================================================
    // INSERTING AND REMOVING
    // ==================================================
    modifyString.remove(at: modifyString.index(before: modifyString.endIndex))
    print("String After Removal: \(modifyString)")

    // ==================================================
    // SUBSTRINGS
    // ==================================================
    let fullString = "Hello, Swift!"
    let index = fullString.firstIndex(of: ",") ?? fullString.endIndex
    let substring = fullString[..<index]
    print("Substring: \(substring)")

    // ==================================================
    // COMPARING STRINGS
    // ==================================================
    let string1 = "Swift"
    let string2 = "Swift"
    print("String Equality: \(string1 == string2)")

    let hasPrefix = string1.hasPrefix("Sw")
    let hasSuffix = string1.hasSuffix("ft")
    print("Prefix: \(hasPrefix), Suffix: \(hasSuffix)")

    // ==================================================
    // UNICODE REPRESENTATIONS OF STRINGS
    // ==================================================
    let unicodeRepresentation = "Swift"
    print("UTF-8 Representation:")
    for codeUnit in unicodeRepresentation.utf8 {
        print(codeUnit)
    }

    print("UTF-16 Representation:")
    for codeUnit in unicodeRepresentation.utf16 {
        print(codeUnit)
    }

    print("Unicode Scalar Representation:")
    for scalar in unicodeRepresentation.unicodeScalars {
        print(scalar.value)
    }
}