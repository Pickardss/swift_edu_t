func runInheritanceExamples() {
    // ==================================================
    // DEFINING A BASE CLASS
    // ==================================================
    class Vehicle {
        var currentSpeed = 0.0 // Temel özellik
        var description: String {
            return "Traveling at \(currentSpeed) km/h"
        }

        func makeNoise() {
            // Temel sınıfta boş bırakılmış, alt sınıflar tarafından özelleştirilebilir
        }
    }
    let someVehicle = Vehicle()
    print(someVehicle.description)

    // ==================================================
    // SUBCLASSING
    // ==================================================
    class Bicycle: Vehicle {
        var hasBasket = false // Alt sınıfa özgü özellik
    }

    let bicycle = Bicycle()
    bicycle.hasBasket = true
    bicycle.currentSpeed = 15.0
    print("Bicycle: \(bicycle.description)")

    // ==================================================
    // OVERRIDING
    // ==================================================
    class Train: Vehicle {
        override func makeNoise() {
            print("Choo Choo") // Alt sınıf, üst sınıf metodunu geçersiz kılar
        }
    }

    let train = Train()
    train.makeNoise()

    // ==================================================
    // ACCESSING SUPERCLASS METHODS, PROPERTIES, AND SUBSCRIPTS
    // ==================================================
    class Car: Vehicle {
        var gear = 1

        override var description: String {
            return super.description + " in gear \(gear)" // Üst sınıf özelliğini kullanır
        }
    }

    let car = Car()
    car.currentSpeed = 60.0
    car.gear = 3
    print("Car: \(car.description)")

    // ==================================================
    // OVERRIDING METHODS
    // ==================================================
    class ElectricCar: Car {
        override func makeNoise() {
            print("Silent mode activated") // Yeni bir metot tanımlanır
        }
    }

    let electricCar = ElectricCar()
    electricCar.makeNoise()

    // ==================================================
    // OVERRIDING PROPERTIES
    // ==================================================
    class SportsCar: Car {
        override var currentSpeed: Double {
            didSet {
                print("Updated speed to \(currentSpeed) km/h") // Özelliğin gözlemcisi geçersiz kılındı
            }
        }
    }

    let sportsCar = SportsCar()
    sportsCar.currentSpeed = 120.0

    // ==================================================
    // OVERRIDING PROPERTY GETTERS AND SETTERS
    // ==================================================
    class ConvertibleCar: Car {
        var isRoofOpen = false

        override var description: String {
            var roofStatus = isRoofOpen ? "open" : "closed"
            return super.description + " with the roof \(roofStatus)" // Getter geçersiz kılındı
        }

        func toggleRoof() {
            isRoofOpen.toggle()
        }
    }

    let convertible = ConvertibleCar()
    convertible.currentSpeed = 80.0
    convertible.toggleRoof()
    print("Convertible: \(convertible.description)")

    // ==================================================
    // PREVENTING OVERRIDES
    // ==================================================
    final class Motorcycle: Vehicle { // Alt sınıfların bu sınıftan türemesini engeller
        final override func makeNoise() { // Alt sınıfların bu metodu geçersiz kılmasını engeller
            print("Bup Bup")
        }
    }

    let motorcycle = Motorcycle()
    motorcycle.makeNoise()
}

/*
SUMMARY:
Bu kod, Swift'te sınıflar arasındaki miras yapısını, metodların ve özelliklerin nasıl geçersiz kılınacağını (override) ve `final` anahtar kelimesinin kullanımını göstermektedir.

1. **Defining a Base Class:**
   - `Vehicle` temel sınıfı, tüm alt sınıfların miras aldığı bir `currentSpeed` özelliği ve bir `description` özelliği içerir.
   - `makeNoise()` metodu, alt sınıflar tarafından özelleştirilebilir.

2. **Subclassing:**
   - `Bicycle` sınıfı, `Vehicle` sınıfından türetilmiştir ve kendine özgü `hasBasket` özelliğini ekler.

3. **Overriding:**
   - `Train` sınıfı, `Vehicle` sınıfının `makeNoise()` metodunu geçersiz kılar ve yeni bir davranış ekler.
   - `Car` sınıfı, `description` özelliğini geçersiz kılar ve üst sınıfın `description` özelliğini genişletir.

4. **Accessing Superclass Methods, Properties, and Subscripts:**
   - `Car` sınıfı, üst sınıfın `description` özelliğini kullanarak kendi `description` özelliğini genişletir.

5. **Overriding Methods:**
   - `ElectricCar` sınıfı, `makeNoise()` metodunu sessiz bir modla değiştirmek için geçersiz kılar.

6. **Overriding Properties:**
   - `SportsCar` sınıfı, `currentSpeed` özelliğini geçersiz kılar ve bir `didSet` gözlemcisi ekler.

7. **Overriding Property Getters and Setters:**
   - `ConvertibleCar` sınıfı, `description` özelliğini geçersiz kılar ve arabanın tavanının açık veya kapalı olup olmadığını belirtir.

8. **Preventing Overrides:**
   - `Motorcycle` sınıfı, `final` anahtar kelimesiyle tanımlanır, böylece başka bir sınıf ondan türeyemez.
   - `makeNoise()` metodu da `final` ile tanımlanır, bu nedenle alt sınıflar tarafından geçersiz kılınamaz.

Bu örnekler, Swift'teki sınıf hiyerarşisinin nasıl oluşturulacağını ve özelleştirileceğini açıklamakta ve `final` anahtar kelimesiyle sınıf ve metot korumasının nasıl sağlanacağını göstermektedir.
*/