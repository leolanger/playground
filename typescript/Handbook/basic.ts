// Boolean
let isDone: boolean = false;

// number
let decimal: number = 6;
let hex: number = 0xf00d;
let binary: number = 0b1010;
let octal: number = 0o744;
let big: bigint = 100n;

// string
let color: string = "blue";
color = 'red';

let fullName: string = 'Bob Bobbington';
let age: number = 37;
let sentence: string = `Hello, my name is ${fullName}. I'll be ${age + 1} years old next month.`;

let sentence1: string =
    "Hello, my name is " +
    fullName +
    ".\n\n" +
    "I'll be " +
    (age + 1) +
    " years old next month.";

// Array
let list: number[] = [1, 2, 3];
let list1: Array<number> = [1, 2, 3];

// Tuple
let x: [string, number];
x = ["hello", 10];

console.log(x[0].substring(1));

// console.log(x[1].substring(1));   error, Property 'substring' does not exist on type 'number'.

// Enum

enum Color {
    Red = 1,
    Green,
    Blue,
}

let c: Color = Color.Green;

let colorName: string = Color[2];

console.log(c);
console.log(colorName);

// Unknown
let notsure: unknown = 4;
notsure = "maybe a string instead";
notsure = false;


// Any

declare function getValue(key: string): any;
const str: string = getValue("mystring");

let looselyTyped: any = 4;
// OK, ifItExists might exist at runtime
looselyTyped.ifItExists();
// OK, toFixed exists (but the compiler doesn't check)
looselyTyped.toFixed();

/* error because Object is of type 'unknown'.
let strictlyTyped: unknown = 4;
strictlyTyped.toFixed();
*/

let looselyTyped1: any = {};
let d = looselyTyped1.a.b.c.d;
//  ^ = let d: any


// Void

function warnUsers(): void {
    console.log("THis is warning message");
}

let unusable: void = undefined;
// OK if `--strictNullChecks` is not given
unusable = null;


// Null and Undefined

let u: undefined = undefined;
let n: null = null;


// Never


// Function returning never must not have a reachable end point
function error(message: string): never {
    throw new Error(message);
}

// Inferred return type is never
function fail() {
    return error("Something failed");
}

// Function returning never must not have a reachable end point
function infiniteLoop(): never {
    while (true) { }
}


// Obeject


declare function create(o: object | null): void;

// OK
create({ prop: 0 });
create(null);

/* error
create(42);
create("string");
create(false);
create(undefined);
*/


// Type assertions


let someValue: unknown = "this is a string";
let strLength: number = (someValue as string).length;


