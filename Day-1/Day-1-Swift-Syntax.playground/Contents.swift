//: Playground - noun: a place where people can play

/* ----------------------------------------------------------------------
Reference section 

Apple docs for Swift: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/index.html#//apple_ref/doc/uid/TP40014097-CH3-ID0
Use println() to print out anything you want to see that's not appearing on the left
Hit Command-Option-Return to see console or Command-Return to hide it

// Comment with two slashes
/* or this */
// Command-slash to toggle comment vs. uncomment

-------------------------------------------------------------------------- */

// DATA TYPES AND VARIABLES

/*
 Delaring constants and variables
   let: declares a constant; the value assigned can never change
   var: declares a variable; the value can change
   Use let unless you know the value should change
*/

let myConstant = "hel/Users/jillcohen/Desktop/Developing iOS 8 Apps with Swiftlo, world"
var myVariable = "hello"
myVariable = "world"

// Uncomment to see error
//myConstant = "newString"

/*
 Naming conventions

https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html#//apple_ref/doc/uid/10000146-SW1
*/

/*
 Core Swift data types:
 String, Int, Double, Array, Dictionary
*/

let name: String = "Jill"
let emptyString: String = String()
var myFavoriteEmojis = "🎉🎊✨💖"
myFavoriteEmojis = "🍭🍩🍫🍪"

let three: Int = 3
let negativeTwo: Int = -2
let oneHalf: Double = 0.5

/*
Type inference in Swift allows the compiler to make an assumption about the type of a new variable or constant based on what's being assigned to it
This means we don't need to write out the type when it can be known for sure
*/

let typeInferredString = name
// Try option-clicking on the name to see its type

let two = 2
let twoPointOh = 3.0
// Swift defaults to Integer in the first case and Double in the second
// See the reference guide for more examples


/*
  Array and Dictionary can store instances of any type
  Arrays are ordered lists
  Dictionaries store a pair of things called a "key-value pair"
  because the value can be looked up by the key (like a dictionary!)
*/

var emptyArray: Array<String> = Array<String>()

// They have special syntax
// Use brackets to make a new array
// or to look up a value at a certain index
let counting: Array<Int> = [1, 2, 3]
var firstObject = counting[0]

// Must declare them with var to add or remove objects
emptyArray.append("hey")
//counting.append(4)

var firstAndLastNames = Dictionary<String, String>()
firstAndLastNames["Jill"] = "Cohen"


var namesToFavoriteNumber1 = Dictionary<String, Int>()
let myName = "Jill"
namesToFavoriteNumber1[myName] = 7
println("\(namesToFavoriteNumber1)")

var namesToFavoriteNumber2 = [myName : 7]

namesToFavoriteNumber1.removeValueForKey(myName)
println("\(namesToFavoriteNumber1)")



let typeInferredArray = [1, 2, 3]
let typeInferredDictionary = namesToFavoriteNumber1



//--------------------------------------------------------------------------

// IF STATEMENTS & BOOLEANS

/*
 A Boolean represents either true or false
 Can be explicit or the result of a logical expression
*/

var boolean: Bool = true
boolean = false

let logicalResult = 1 > 3

if logicalResult {
    println("that was true!")
} else {
    println("that was false!")
}

if myName == "Jill" {
    println("woo! got it right")
}

if 1 != 0 {
    println("if statements can only take true/false; not 0 or 1")
}


//--------------------------------------------------------------------------

// LOOPS

var i = 3
while i > 0 {
    println("\(i)")
    i--
}


for index in 1...3 {
    println(index)
}

let randomNumbers = [0, 0.5, -1, 300, 1234, -6.7]

for index in 0..<randomNumbers.count {
    let number = randomNumbers[index]
    println("there's an easier way to do this...")
}

// Fast enumeration - can be used on Dictionaries, too
for number in randomNumbers {
    println("\(number)")
}



//--------------------------------------------------------------------------

// FUNCTIONS

// May take one or more parameters and return one or more values
func sayHello() {
    println("hello!")
}

sayHello()

func sayHelloTo(name: String) {
    println("hello, \(name)!")
}

sayHelloTo("Prachi")

func combineNames(first: String, last: String) -> String {
    return first + " " + last
}

combineNames("Josh", "Johnson")

func countdown(firstNumber: Int, message: String) {
    var count = firstNumber
    while count > 0 {
        println("\(count)")
        count--
    }
    println(message)
}

countdown(3, "Happy New Year!")

