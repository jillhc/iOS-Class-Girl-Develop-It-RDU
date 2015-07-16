// In-class demos

// CLASS BEGINS HERE
class LiveEvent {
    let producer = "Live Nation"

    var eventName = String()
    var venue = String()
    let ticketPrice = 50.00
    var numberOfAttendees = Int()
    var totalRevenue: Double = 0
    var isFavorite = false

    func toggleFavorite() {
        isFavorite = !isFavorite
        println("\(eventName) is a favorite? \(isFavorite)!")
    }

    func buyTicket() {
        println("wooo! Ticket purchased for \(ticketPrice)")
    }
}

// CLASS ENDS HERE

// OTHER CODE BEGINS HERE
var genericEvent = LiveEvent()

// assigning a property
genericEvent.eventName = "live event"

// calling a function
genericEvent.toggleFavorite()

// reading a property
let price = genericEvent.ticketPrice


class Concert: LiveEvent {
    var artist = String()
    var setlist = Array<String>()

    override func buyTicket() {
        super.buyTicket()
        println("plus $5 in fees")
    }}


// CLASS ENDS, other code begins

var swiftConcert = Concert()
swiftConcert.eventName = "1989 Tour"
swiftConcert.artist = "Taylor Swift"
swiftConcert.toggleFavorite()

// polymorphism
genericEvent.buyTicket()
swiftConcert.buyTicket()


// Here's one way we could write SportsGame...
class SportsGameInitial: LiveEvent {
    var homeTeamName = String()
    var homeTeamRoster = Array<String>()
    var awayTeamName = String()
    var awayTeamRoster = Array<String>()
    // we could add coach, W-L record, etc.

    var league = String()

    var finalHomeScore = Int()
    var finalAwayScore = Int()

    func homeTeamDidWin() -> Bool {
        return finalHomeScore > finalAwayScore
    }
}


// Must make design decions about how to break out information & responsibilities

// Instead, let's separate out the responsibility of managing team-related information into a new class
// So SportsGameRevised only has to manage game-specific information

class SportsTeam {
    var teamName = String()
    var roster = Array<String>()
    var league = String()
    var winningPercentage = Double()
}


class SportsGameRevised: LiveEvent {
    var homeTeam = SportsTeam()
    var awayTeam = SportsTeam()
    var finalHomeScore = Int()
    var finalAwayScore = Int()

    func homeTeamDidWin() -> Bool {
        return finalHomeScore > finalAwayScore
    }
}


/************************************************/

// Another example

// Objects have data stored in "properties" and associated functions called "methods"


class Vehicle {

    // Properties require default initial values
    var velocity = 0
    var owner = String()

    func moveForward() {
        println("This does nothing")
    }

    func stop() {
        println("stopping!")
        velocity = 0
    }

    // Subclasses must call super then print the number of wheels
    // (When writing a program, I would include that comment to let users know their responsibilities)
    func declareNumberOfWheels() {
        println("\(owner)'s vehicle has this many wheels: ")
    }
}


let newVehicle = Vehicle()
newVehicle.owner = "Duncan"
newVehicle.declareNumberOfWheels()
newVehicle.moveForward()

// The Vehicle class isn't super useful on its own, since move forward doesn't actually do anything
// Let's get more specialized by subclassing...


class Bicycle: Vehicle {

    // override keyword is required to override a superclass' method
    override func moveForward() {
        println("unlocking my bike (if needed), pedaling...")
        velocity = velocity + 5
    }

    override func declareNumberOfWheels() {
        // Call super first as required
        super.declareNumberOfWheels()
        println("2")
    }
}


class Car: Vehicle {

    override func moveForward() {
        println("turning the car on (if needed), hitting the gas, etc...")
        velocity = velocity + 45
    }

    override func declareNumberOfWheels() {
        super.declareNumberOfWheels()
        println("4")
    }

    // Sublcasses can add new functionality too
    func honk() {
        println("HONK!!!")
    }
}

// Now, it's super easy to use any kind of Vehicle
// And it isn't necessarily important to us what kind of Vehicle each instance happens to be
// because their properties and methods have the same names

let myVehicle = Bicycle()
myVehicle.owner = "Jill"

let yourVehicle = Car()
yourVehicle.owner = "[your name here]"

myVehicle.declareNumberOfWheels()
yourVehicle.declareNumberOfWheels()

myVehicle.moveForward()
yourVehicle.moveForward()


myVehicle.stop()
yourVehicle.stop()


// Sometimes, the specific subclass is relevant because we do want to use its specialized functionality
let myCar = Car()
myCar.honk()



/* ************************************************************

Compare the above to a design where we didn't have objects or inheritance
We must keep track of all vehicles' current velocity separately
and write and remember separate functions for all of them */

var carsVelocity = 0
var carsOwner = "Jill"
var bikesVelocity = 0
var bikesOwner = "Duncan"

func moveCarForwardFromInitialVelocity(velocity: Int) -> Int {
    println("turning the car on (if needed), hitting the gas, etc...")
    return velocity + 45
}

func moveBikeForwardFromInitialVelocity(velocity: Int) -> Int {
    println("unlocking my bike (if needed), pedaling...")
    return velocity + 5
}

func stopCar() -> Int {
    return 0
}

func stopBike() -> Int {
    return 0
}

func declareNumberOfCarsWheels(owner: String) {
    println("\(owner)'s vehicle has this many wheels: 4")
}

func declareNumberOfBikesWheels(owner: String) {
    println("\(owner)'s vehicle has this many wheels: 2")
}


// We're getting the same outcome, but it's much harder to 
// ensure you're using the right function in exactly the right way
// For example, here you must know to assign the return value back to the appropriate velocity variable

carsVelocity = moveCarForwardFromInitialVelocity(carsVelocity)
bikesVelocity = moveBikeForwardFromInitialVelocity(bikesVelocity)

carsVelocity = stopCar()
carsVelocity = stopBike()

declareNumberOfBikesWheels(bikesOwner)
declareNumberOfCarsWheels(carsOwner)




