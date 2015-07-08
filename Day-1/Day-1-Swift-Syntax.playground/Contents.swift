//: Playground - noun: a place where people can play

/* ----------------------------------------------------------------------
Reference section 

Apple docs for Swift: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/index.html#//apple_ref/doc/uid/TP40014097-CH3-ID0


// Comment with two slashes
/* or this */
// Command-slash to toggle comment vs. uncomment


Strategies if results stop appearing in the playground:
 1. Make sure there are no compiler errors. Either fix or comment out any sections with errors.
 2. Check the Console on the right for errors
- Use println() to print out anything you want to see that's not appearing on the left

- Hit Command-Option-Return to see console or Command-Return to hide it


-------------------------------------------------------------------------- */

// DATA TYPES AND VARIABLES

/*
Core Swift data types:
String, Int, Double, Array
*/

var myName: String = "Jill"

// () creates a new instance of that type
var emptyString: String = String()
var myFavoriteEmojis = "🎉🎊✨💖"

var three: Int = 3
var negativeTwo: Int = -2
var oneHalf: Double = 0.5

/*
 Type inference:
 Allows the compiler to make an assumption about the type of a new variable or constant based on the value being assigned to it
 Don't need to write out the type when it can be known for sure

 Try option-clicking on the name of a variable below to see its type
*/

var typeInferredDouble = 1.5
var typeInferredString = myName
// Try option-clicking on the name to see its type

var two = 2
var twoPointOh = 2.0
// Swift defaults to Integer in the first case and Double in the second
// See the reference guide for more examples

// Do need to explicitly declare the type sometimes -- when it's ambiguous or the value isn't known
// Here, the type can't be inferred because no value has been assigned
var unassigned: String


/// Swift is "strictly typed"
// Variable maintains its type throughout its lifetime; cannot be reassigned to a value of a different type, no matter how it's declared

// Uncomment to see error
//unassigned = 1
unassigned = "now I've got a value!"


/*
 Declaring constants and variables
   let: declares a constant; the value assigned can never change
   var: declares a variable; the value can change

   Use "let" unless you know the value should change
   This helps you know that everywhere in your code, this value is constant
   And it helps the compiler make sure the value never changes (i.e., it's not reassigned or changed inside a function)
*/

let suiteNumber = 150
let myConstant = "hello, world"
// Constants can't change value; Uncomment to see error
//myConstant = "newString"

var myVariable = "hello"
myVariable = "world"


/*
 Naming conventions: 

Descriptive (may get lengthy -- that's okay!)
Avoid abbreviations
Camel Case (first letter lower case, all other words begin with upper case letter)

https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html#//apple_ref/doc/uid/10000146-SW1
*/





/*
  Arrays are ordered lists and can store elements of any type
  Must be give information about about the type of elements contained,
  either explicitly  or by creating an array from other objects

  Syntax:
    Two ways of delaring (see below)
    Use brackets to create an array from existing objects
    Can use brackets to look up a value at a certain index
*/

var emptyArray = Array<String>()
var alsoAnEmptyArray = [String]()

let counting: Array<Int> = [1, 2, 3]

let typeInferredArray = [1, 2, 3]

// Must declare them with var to add or remove objects
emptyArray.append("hey")

// Can't add elements to a "let" array; Uncomment to see error
//counting.append(4)


// After an array is created containing a certain type, can only add objects of that same type
var iOSClassRoster = Array<String>()
iOSClassRoster.extend(["Fallon", "Sara"])
//iOSClassRoster.append(4)


// Accessing elements by index
let firstObject = counting[0]
let secondObject = counting[1]
// Convenience methods to get first and last object
let first = counting.first
let last = counting.last


//--------------------------------------------------------------------------

// IF STATEMENTS & BOOLEANS

/*
 A Boolean represents either true or false
 Can be explicit or the result of a logical expression
*/

let trueConstant: Bool = true
let falseConstant = false

let logicalResult = 1 > 3

if logicalResult {
    println("that was true!")
} else {
    println("that was false!")
}

if 4 > 5 {
    println("that was true!")
    // Note the warning that this will never be executed
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

// FUNCTIONS

// No parameters, no return value
func sayHello() {
    println("hello!")
}

sayHello()


// One parameter, no return value

// Note that the parameter requires a type
// Enforces a contract between the function and anyone calling it
func sayHelloTo(name: String) {
    // Combine strings with either + or \()
    println("hello, \(name)!")
}

sayHelloTo("Josh")

// One parameter, one return value
func ageInDogYears(age: Int) -> Int {
    return age * 7
}

ageInDogYears(10)

// Two parameters, one return value
func combineNames(first: String, last: String) -> String {
    return first + " " + last
}

combineNames("Josh", "Johnson")

// Exercise: write a function that
//    takes first, last, age
//    returns "hello, Jill Cohen, you are 70 in dog years!"



//     Multiple ways of approaching this

//     1. declare as new constants
//func greetWithDogYears(first: String, last: String, age: Int) -> String {
//    let combinedName = first + " " + last
//    let newAge = age * 7
//
//    return "hello, \(combinedName), you are \(newAge)) in dog years!"
//}



// 2. Use above functions in new constants
// I prefer this since it doesn't create duplicate code, but it's more readable than calling the functions inline
func greetWithDogYears(first: String, last: String, age: Int) -> String {
    let combinedName = combineNames(first, last)
    let newAge = ageInDogYears(age)

    return "hello, \(combinedName), you are \(newAge)) in dog years!"
}

// 3. Use above functions inline
//func greetWithDogYears(first: String, last: String, age: Int) -> String {
//    return "hello, \(combineNames(first, last)), you are \(ageInDogYears(age))) in dog years!"
//}

println(greetWithDogYears("John", "Smith", 100))

// Note: if your function has 3 or more lines, including a line of
// whitespace between your function body and return statement increases readability

