// Object-Oriented Swift

// 1.2.3.

enum Gender {
    case male
    case female
    case undefined
}

class Animal {
    var gender: Gender
    init(gender: Gender) {
        self.gender = gender
    }
    func eat() {
        print("I eat everything!")
    }
}

class Elephant: Animal {
    override func eat() {
        print("I eat grass!")
    }
}

class Tiger: Animal {
    override func eat() {
        print("I eat animals!")
    }
}

class Horse: Animal {
    override func eat() {
        print("I eat hay!")
    }
}

class Zoo {
    var weeklyHot: Animal
    init(weeklyHot: Animal) {
        self.weeklyHot = weeklyHot
    }
}

let tiger = Tiger(gender: .male)
let elephant = Elephant(gender: .male)
let horse = Horse(gender: .male)

let zoo = Zoo(weeklyHot: Tiger(gender: .male))


zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

/*
 
 4.
 - Structures are values types, while classes are reference types.
 - Classes can inherit methods, properties, and other characteristics from other classes, while structures can't.
 - An instance of a structure is seen as a value, while class instance is object with identity.
 - Structures copy values when used in the new place, while classes share their data.
 - Structures are immutable when declared as constants, while classes properties remain mutable.
 
 5.
 Instance methods are methods which we call on an instance of a particaular type, and they can't be called whithout an existing instance.
 On the other hand, type methods are called on the type itself, and it can still be called without an existing instance of that type.
 
 6.
 Intitalizers are called to create an instance of a particular type.
 They allow us to proceed with initialization, ensuring every stored property of the instance has a intial value,
 which is required in a class or a structure.
 
 7.
 - in instance method: self is equivalent to the instance itself. We can use it to refer to current instance within the instance method.
 - in type method: self is equivalent to the type itself. We can use it to tell apart type property and type method parameter from another.
 
 8.
 - Reference types share a single copy of data, while value types keep a unique copy of data.
 - For value types, we can't mutate the instance when declared as constants, regardless of whether properties are declared with let or var.
   But for reference type, we can mutate the instace itself.
 
 
 */

// Enumerations and Optionals in Swift

// 1.
enum Gasoline: String {
    case oil92 = "92"
    case oil95 = "95"
    case oil98 = "98"
    case diesel = "diesel"

    func getPrice() -> Double {
        switch self {
        case .oil92:
            return 28.7
        case .oil95:
            return 30.2
        case .oil98:
            return 32.3
        case .diesel:
            return 25.8
        }
    }
}

Gasoline.oil95.getPrice()
Gasoline.diesel.rawValue

/*
 Associtate values are the information we can use to store values of other types alongside the defined case values.
 - associate values can have different types for each case
 - we can add label names to associate values
 - we can only use either raw value or associate value in an enumeration, not both
 
 */

// 2.

class Pet {
    let name = "Alpha"
}

class People {
    var pet: Pet?
}

func unWrapPetName() {
    let dean = People()
    guard let petName = dean.pet?.name
    else {
        return
    }
}

func unWrapPetName2() {
    let chris = People()
    if let petName2 = chris.pet?.name {
        return
    }
}

// Protocol in Swift

// 1.

protocol PoliceMan {
    func arrestCiminals()
}

protocol ToolMan {
    func fixComputer()
}

struct Person: PoliceMan {
    let name: String
    let toolMan: ToolMan
    func arrestCiminals() {
    }
}

struct Engineer: ToolMan {
    let name: String
    func fixComputer() {
    }
}

struct personInstance: ToolMan {
    func fixComputer() {
    }
    func createInstance() {
        let steven = Person(name: "Steven", toolMan: self)
    }
}

// Error Handling in Swift

enum GuessNumberGameError: Error {
    case wrongNumber
}
class GuessNumerGame {
    var targetNumber = 10
    func guess(number: Int) throws {
        guard number == targetNumber else {
            throw GuessNumberGameError.wrongNumber
        }
        print("Guess the right number: \(targetNumber)")
    }
}

do {
    try GuessNumerGame().guess(number:20)
}
catch GuessNumberGameError.wrongNumber {
    print("Guess the wrong number")
}
