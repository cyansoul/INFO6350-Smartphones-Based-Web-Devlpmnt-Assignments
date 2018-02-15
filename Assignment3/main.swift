//
//  main.swift
//  Assignment3
//
//  Created by Tianyu Wang on 2/6/18.
//  Copyright © 2018 Tianyu Wang. All rights reserved.
//

import Foundation

print("Hello, World!")

// Exercise: Swift Functions
func add(a: Int, b: Int) {
    print("sum: \(a + b)")
}
add(a: 5, b: 23)

func multiply(a: Int, b: Int) {
    print("multiplication: \(a * b)")
}
multiply(a: 12, b: 3)

func compute(flag: Bool, a: Int, b: Int) {
    if flag {
        print("sum: \(a + b)")
    }
    if !flag {
        print("multiplication: \(a * b)")
    }
}
compute(flag: true, a: 24, b: 52)

// Exercise: Swift Structures
struct Planet{
    var name: String
    var distanceFromSun: Double
    
    init(name: String, distanceFromSun: Double) {
        self.name = name
        self.distanceFromSun = distanceFromSun
    }
}

print("Plant No.1:")
var features1 = Planet(name: "Earth", distanceFromSun: 149600000.00)
print(features1.name)
print(features1.distanceFromSun)

print("Plant No.2:")
var features2 = Planet(name: "Moon", distanceFromSun: 356330.00)
print(features2.name)
print(features2.distanceFromSun)

func compute(flag: Bool, a: Double, b: Double) {
    if flag {
        print("sum: \(a + b)")
    }
    if !flag {
        print("multiplication: \(a * b)")
    }
}

print("The sum of two distances:")
compute(flag: true, a: features1.distanceFromSun, b: features2.distanceFromSun)

// Exercise: Swift Classes
class Animal {
    func makeNoise() {
        
    }
}

class Dog: Animal {
    override func makeNoise() {
        print("Dogs bark")
    }
}

class Cat: Animal {
    override func makeNoise() {
        print("Cats purr")
    }
}

let dog = Dog()
dog.makeNoise()

let cat = Cat()
cat.makeNoise()

var arr = [AnyObject]()
arr.append(dog)
arr.append(cat)
for obj in arr {
    if obj is Animal {
        print("(\(obj.self)) is an instance of class Animal")
    }
}

// Exercise: Swift Optionals
func isPurnInt(string: String) -> Bool {
    
    let scan: Scanner = Scanner(string: string)
    
    var val:Int = 0
    
    return scan.scanInt(&val) && scan.isAtEnd
    
}

print("Please enter your name:")

var name: String?
name = readLine()

if (name != "") {
    if (isPurnInt( string: name! )) {
        print("Welcome Code Name \(name!)")
    } else {
        print("Welcome \(name!)")
    }
} else if (name == "") {
    print("Welcome Anonymous User!")
}

// Exercise: Swift Extension
extension Int {
    mutating func calculate() {
        print("square: \(self * self) sum: \((1 + self) * self / 2)")
    }
}
var someInt = 5
someInt.calculate()

// Exercise: Swift Protocol
protocol animalPro: class {
    var numberOfLegs: Int { get }
    var specie: String { get }
}

class Dog2: animalPro {
    
    var someInt = 4

    var numberOfLegs: Int {
        return someInt
    }
    var specie: String {
        return "mammal"
    }
}

class Cat2: animalPro {
    
    var someInt = 4
    
    var numberOfLegs: Int {
        return someInt
    }
    var specie: String {
        return "mammal"
    }
}
