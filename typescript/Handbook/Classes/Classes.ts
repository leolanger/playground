/* Classes */

class Greeter {
    greeting: string;


    constructor(message: string) {
        this.greeting = message;
    }

    greet() {
        return "Hello, " + this.greeting;
    }
}

let greeter = new Greeter("world");

/* Inheritance */

class Animal {
    name: string;

    constructor(theName: string) {
        this.name = theName;
    }

    move(distanceInMeters: number = 0) {
        console.log(`${this.name} moved ${distanceInMeters}m.`);
    }

}

class Dog extends Animal {
    bark() {
        console.log("Woof Woof");
    }
}

class Snake extends Animal {
    constructor(name: string) {
        super(name);
    }
    move(distanceInMeters = 5) {
        console.log("Slithering...");
        super.move(distanceInMeters);
    }
}

class Horse extends Animal {
    constructor(name: string) {
        super(name);
    }
    move(distanceInMeters = 45) {
        console.log("Galloping...");
        super.move(distanceInMeters);
    }
}

let sam = new Snake("Sammy the Python");
let tom: Animal = new Horse("Tommy the Palomino");

sam.move();
tom.move(34);

const dog = new Dog(" ");
dog.bark();
dog.move(10);
dog.bark();

let animal = new Animal("Goat");
animal = sam;

/* Protected */

class Person {
    protected name: string;
    protected constructor(name: string) {
        this.name = name;
    }
}

class Employee extends Person {
    private department: string;

    constructor(name: string, department: string) {
        super(name);
        this.department = department;
    }

    public getElevatorPitch() {
        return `Hello, my name is ${this.name} and I work in ${this.department}.`;
    }
}

let howard = new Employee("Howard", "Sales");
// let john = new Person("John");   // error
// Constructor of class 'Person' is protected and only accessible within the class declaration.
console.log(howard.getElevatorPitch());
// console.log(howard.name);    // error
// Property 'name' is protected and only accessible within class 'Person' and its subclasses

/* Readonly modifier */

class Octopus {
    readonly name: string;
    readonly numberOfLegs: number = 8;

    constructor(theName: string) {
        this.name = theName;
    }
}

let dad = new Octopus("Man with the 8 strong legs");
// dad.name = "Man with the 3-piece suit";  // error
// Cannot assign to 'name' because it is a read - only property.

/* Parameter properties */

class Octopus1 {
    readonly numberOfLegs: number = 8;
    constructor(readonly name: string) { };
}

let dad1 = new Octopus1("Man with th e 8 strong legs");
dad.name;

/* Accessors */

const fullNameMaxLength = 10;

class Employee1 {
    private _fullName: string = "";

    get fullName(): string {
        return this._fullName;
    }

    set fullName(newName: string) {
        if (newName && newName.length > fullNameMaxLength) {
            throw new Error("fullName has a max length of " + fullNameMaxLength);
        }

        this._fullName = newName;
    }
}

let employee = new Employee1();
employee.fullName = "Bob Smith";

if (employee.fullName) {
    console.log(employee.fullName);
}


/* Static Properties */

class Grid {
    static origin = { x: 0, y: 0 };

    calculateDistanceFromOrigin(point: { x: number, y: number }) {
        let xDist = point.x - Grid.origin.x;
        let yDist = point.y - Grid.origin.y;
        return Math.sqrt(xDist * xDist + yDist * yDist) / this.scale;
    }

    constructor(public scale: number) { };

}

let grid1 = new Grid(1.0); // 1x scale
let grid2 = new Grid(5.0); // 5x scale

console.log(grid1.calculateDistanceFromOrigin({ x: 10, y: 10 }));
console.log(grid2.calculateDistanceFromOrigin({ x: 10, y: 10 }));

/* Abstract Classes */

abstract class Department {
    constructor(public name: string) { };

    printName(): void {
        console.log("Department name: " + this.name);
    }

    abstract printMeeting(): void;
}

class AccountingDepartment extends Department {
    constructor() {
        super("Accounting and Auditing");
    }

    printMeeting(): void {
        console.log("The Accounting Department meets each Monday at 10am.");
    }

    generateReports(): void {
        console.log("Generating accounting reports...");
    }
}

let department: Department; // ok to create a reference to an abstract type
// department = new Department(); // error: cannot create an instance of an abstact class

department = new AccountingDepartment(); // ok to create and assign a non-abstract subclass
department.printName();
department.printMeeting();
// department.generateReports(); // error:Property 'generateReports' does not exist on type 'Department'.



/* Constructor functions */

class Greeter1 {
    greeting: string;

    constructor(message: string) {
        this.greeting = message;
    }

    greet() {
        return "Hello, " + this.greeting;
    }
}

let greeter1: Greeter;
greeter1 = new Greeter("world");
console.log(greeter1.greet()); // "Hello, world"


let Greeter2 = (function () {
    function Greeter2(message) {
        this.greeting = message;
    }

    Greeter2.prototype.greet = function () {
        return "Hello, " + this.greeting;
    }

    return Greeter2;
})();

let greeter2;
greeter2 = new Greeter2("world");
console.log(greeter2.greet);

/* Using a class as an interface */

class Point1 {
    a: number;
    b: number;
}

interface Point3d extends Point1 {
    z: number;
}

let point3d: Point3d = { a: 1, b: 2, z: 3 };