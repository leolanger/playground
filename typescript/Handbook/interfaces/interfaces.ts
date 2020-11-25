// In TypeScript, interfaces fill the role of naming these types,
// and are a powerful way of defining contracts within your code 
// as well as contracts with code outside of your project.

/*first example*/

function printLabel(labelledObj: { label: string }) {
    console.log(labelledObj.label);
}

let myObj = { size: 10, label: "Size 10 Object" };
printLabel(myObj);


interface LabeledValue {
    label: string;
}

function printLabel1(labelledObj: LabeledValue) {
    console.log(labelledObj.label);
}

let myObj1 = { size: 10, label: "Size 10 Object" };
printLabel1(myObj1);

/*Optional Properties*/

// for example, had we mistyped the name of the color property in createSquare,
// we would get an error message letting us know:

interface SquareConfig {
    color?: string;
    width?: number;
}

function createSquare(config: SquareConfig): { color: string; area: number } {
    let newSquare = { color: "white", area: 100 };
    if (config.color) {
        newSquare.color = config.color;
    }
    if (config.width) {
        newSquare.area = config.width * config.width;
    }
    return newSquare;
}

let mySquare = createSquare({ color: "black" });

/* Readonly properties */

interface Point {
    readonly x: number;
    readonly y: number;
}

// let p1: Point = { x: 10, y: 20 };
// p1.x = 5;   error!
// Cannot assign to 'x' because it is a read-only property.


let a: number[] = [1, 2, 3, 4];
let ro: ReadonlyArray<number> = a;

// ro[0] = 12; // error!
// @ Index signature in type 'readonly number[]' only permits reading.
// ro.push(5); // error!
// @ Property 'push' does not exist on type 'readonly number[]'.
// ro.length = 100; // error!
// @ Cannot assign to 'length' because it is a read-only property.
// a = ro; // error!
// @ The type 'readonly number[]' is 'readonly' and cannot be assigned to the mutable type 'number[]'.

let b: number[] = [1, 2, 3, 4];
let ro1: ReadonlyArray<number> = b;

b = ro1 as number[];

// Variables use const whereas properties use readonly.

/*Excess Property CHecks */


// interfac{ size: 10, label: "Size 10 Object" }e SquareConfig {
//     color?: string;
//     width?: number;
// }
// function createSquare2(config: SquareConfig): { color: string; area: number } {
//     return {
//         color: config.color || "red",
//         area: config.width ? config.width * config.width : 20,
//     };
// }
// let mySquare2 = createSquare2({ colour: "red", width: 100 });

/**Argument of type '{ colour: string; width: number; }'
 * is not assignable to parameter of type 'SquareConfig'.
   Object literal may only specify known properties,
   but 'colour' does not exist in type 'SquareConfig'.
   Did you mean to write 'color'?
*/

interface SquareConfig {
    color?: string;
    width?: number;
    // method1.
    [propName: string]: any;
}

function createSquare2(config: SquareConfig): { color: string; area: number } {
    return {
        color: config.color || "red",
        area: config.width ? config.width * config.width : 20,
    };
}

let mySquare2 = createSquare2({ width: 100, opacity: 0.5 }) as SquareConfig;
// method2.
let squareOptions = { colour: "red", width: 100 };
let mySquare3 = createSquare(squareOptions);

// let squareOptions = { colour: "red" };
// let mySquare = createSquare(squareOptions);  error
// @ Type '{ colour: string; }' has no properties in common with type 'SquareConfig'.


/*Function Types*/

interface SearchFunc {
    (source: string, subString: string): boolean;
}

let mySearch: SearchFunc;
mySearch = function (Source: string, subString: string) {
    let result = Source.search(subString);
    return result > -1;
}


/*Indexable Types */

interface StringArray {
    [index: number]: string;
}

let myArray: StringArray;
myArray = ["Bob", "Fred"];

let myStr: string = myArray[0];


// interface NumberDictionary {
//     [index: string]: number;
//     length: number; // ok, length is a number
//     name: string; // error, the type of 'name' is not a subtype of the indexer
// @ Property 'name' of type 'string' is not assignable to string index type 'number'.

// }

interface NumberOrStringDictionary {
    [index: string]: number | string;
    length: number; // ok, length is a number
    name: string; // ok, name is a string
}

/* Class Types */

interface ClockInterfaces {
    currentTime: Date;
    setTime(d: Date): void;
}

class Clock implements ClockInterfaces {
    currentTime: Date = new Date();
    setTime(d: Date) {
        this.currentTime = d;
    }
    constructor(h: number, m: number) { }
}

//eg.

interface ClockConstructor {
    new(hour: number, minute: number): ClockInterface;
}

interface ClockInterface {
    tick(): void;
}

function creatClock(ctor: ClockConstructor, hour: number, minute: number): ClockInterface {
    return new ctor(hour, minute);
}

class DigitalClock implements ClockInterface {
    constructor(h: number, m: number) { }
    tick() {
        console.log("beep beep");
    }
}

class AnalogClock implements ClockInterface {
    constructor(h: number, m: number) { }
    tick() {
        console.log("tick tock");
    }
}

let digital = creatClock(DigitalClock, 12, 17);
let analog = creatClock(AnalogClock, 7, 32);


/* Extending Interfaces */

interface Shape {
    color: string;
}

interface PenStroke {
    penWidth: number;
}

interface Square extends Shape, PenStroke {
    sideLength: number;
}

let square = {} as Square;
square.color = "blue";
square.sideLength = 10;
square.penWidth = 5.0;


/* Hybrid Types */

interface Counter {
    (start: number): string;
    interval: number;
    reset(): void;
}

function getCounter(): Counter {
    let counter = function (start: number) { } as Counter;
    counter.interval = 123;
    counter.reset = function () { };
    return counter;
}

let z = getCounter();
z(10);
z.reset();
z.interval = 5.0;


/* Interfaces Extending Classes */

