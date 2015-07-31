

var optionalDouble: Double? = 3.2
optionalDouble = nil

let number1 = "1234"
let number2 = "z09$asdf1234"





















let potentialNumber1 = number1.toInt()
let potentialNumber2 = number2.toInt()

println(potentialNumber1)
println(potentialNumber2)

let definitelyANumber = 3 + 2




var myArray = Array<Int>()
myArray.append(1)
let myInt: Int = 1

myArray.append(myInt)

if potentialNumber1 != nil {
    myArray.append(potentialNumber1!)
} else {
    ///
}


myArray.append(potentialNumber1!)

if potentialNumber2 != nil {
    myArray.append(potentialNumber2!)
} else {
    println("couldn't append because nil")
}





let emptyString = ""
let optionalString1: String? = nil
let optionalString2: String? = ""

//println(emptyString == optionalString)

let result = emptyString.isEmpty
let result1 = optionalString1?.isEmpty
