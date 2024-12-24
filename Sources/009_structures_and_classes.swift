func runStructuresAndClassesExamples() {
    // ==================================================
    // DEFINITION SYNTAX
    // ==================================================
    struct Resolution {
        var width = 0
        var height = 0
    }
    class VideoMode {
        var resolution = Resolution()
        var frameRate = 0.0
        var name: String?
    }

    // ==================================================
    // STRUCTURE AND CLASS INSTANCES
    // ==================================================
    let someResolution = Resolution()
    let someVideoMode = VideoMode()

    print("Resolution width: \(someResolution.width)")
    print("VideoMode frame rate: \(someVideoMode.frameRate)")

    // ==================================================
    // ACCESSING PROPERTIES
    // ==================================================
    someVideoMode.resolution.width = 1920
    someVideoMode.frameRate = 60.0
    someVideoMode.name = "1080p"

    print("Updated Resolution width: \(someVideoMode.resolution.width)")
    print("Updated Frame Rate: \(someVideoMode.frameRate)")
    print("Video Mode Name: \(someVideoMode.name ?? "Unknown")")

    // ==================================================
    // MEMBERWISE INITIALIZERS FOR STRUCTURE TYPES
    // ==================================================
    let vgaResolution = Resolution(width: 640, height: 480)
    print("VGA Resolution: \(vgaResolution.width)x\(vgaResolution.height)")

    // ==================================================
    // STRUCTURES AND ENUMERATIONS ARE VALUE TYPES
    // ==================================================
    let hdResolution = Resolution(width: 1920, height: 1080)
    var cinemaResolution = hdResolution
    cinemaResolution.width = 2048

    print("HD Resolution width: \(hdResolution.width)") // Değişmez
    print("Cinema Resolution width: \(cinemaResolution.width)") // Yeni değer

    // ==================================================
    // CLASSES ARE REFERENCE TYPES
    // ==================================================
    let tenEighty = VideoMode()
    tenEighty.resolution = hdResolution
    tenEighty.frameRate = 30.0
    let alsoTenEighty = tenEighty // Aynı referansa işaret eder

    alsoTenEighty.frameRate = 60.0
    print("Frame Rate after update: \(tenEighty.frameRate)") // 60.0 olur

    // ==================================================
    // IDENTITY OPERATORS
    // ==================================================
    if tenEighty === alsoTenEighty { // === referans karşılaştırır
        print("tenEighty and alsoTenEighty refer to the same instance.")
    }
    if tenEighty !== someVideoMode { // !== farklı referans kontrolü
        print("tenEighty and someVideoMode refer to different instances.")
    }

    // ==================================================
    // POINTERS
    // ==================================================
    // Swift'te doğrudan işaretçiler kullanılmaz.
    // Ancak UnsafePointer veya UnsafeMutablePointer türleri kullanılarak işaretçi tabanlı işlemler yapılabilir.

    let a = 42
    withUnsafePointer(to: a) { pointer in
        print("Pointer Address: \(pointer)") // İşaretçi adresini gösterir
    }

    var mutableValue = 42
    withUnsafeMutablePointer(to: &mutableValue) { pointer in
        pointer.pointee += 1 // İşaretçi ile değeri değiştirme
        print("Updated Value: \(pointer.pointee)")
    }
}

/*
 SUMMARY:
 Bu kod, Swift'te yapılar (struct) ve sınıflar (class) arasındaki farkları ve kullanımlarını açıklar:

 1. **Comparing Structures and Classes:**
    - Yapılar değer türüdür (value type); kopyalandıklarında ayrı bir örnek oluştururlar.
    - Sınıflar referans türüdür (reference type); kopyalandıklarında aynı referansı paylaşırlar.
    - Sınıflar miras (inheritance) alabilirken, yapılar alamaz.

 2. **Definition Syntax:**
    - Yapı ve sınıf tanımlama.
    - `Resolution` bir yapı, `VideoMode` bir sınıf örneğidir.

 3. **Structure and Class Instances:**
    - Yapı ve sınıf örneklerinin oluşturulması.
    - Özelliklere erişim ve güncelleme.

 4. **Accessing Properties:**
    - Sınıf ve yapı özelliklerinin değiştirilmesi.

 5. **Memberwise Initializers for Structure Types:**
    - Yapılar, özelliklerini başlatmak için otomatik olarak üye-inişleme (memberwise initializer) alır.

 6. **Structures and Enumerations Are Value Types:**
    - Yapılar ve enum'lar kopyalandığında yeni bir örnek oluşturulur.
    - `cinemaResolution` ayrı bir örnektir ve `hdResolution`'ı değiştirmez.

 7. **Classes Are Reference Types:**
    - Sınıflar aynı referansı paylaşır.
    - `alsoTenEighty` ve `tenEighty` aynı sınıf örneğini işaret eder.

 8. **Identity Operators:**
    - `===` ve `!==` ile sınıf referanslarının aynı örneği işaret edip etmediği kontrol edilir.

 9. **Pointers:**
    - Swift'te doğrudan işaretçiler kullanılmaz, ancak `UnsafePointer` ve `UnsafeMutablePointer` kullanılarak işaretçi tabanlı işlemler yapılabilir.

 Bu kod, yapıların ve sınıfların temellerini anlamak için rehber niteliğindedir.
 Değer türleri (struct) ve referans türleri (class) arasındaki farklar uygulamalı olarak gösterilmektedir.
*/