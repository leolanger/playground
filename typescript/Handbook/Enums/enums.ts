/* Numeric enums */

enum Direction {
    Up = 1,
    Down,
    Left,
    Right,
}

enum UserResponse {
    No = 0,
    Yes = 1,
}


function respond(recipient: string, message: UserResponse): void {
    // ...
}

respond("Princess Caroline", UserResponse.Yes);

/* String enums */

enum SDirection {
    Up = "UP",
    Down = "DOWN",
    Left = "LEFT",
    Right = "RIGHT",
}

/* Hetergeneous enums */

enum BooleanLikeHeterogeneousEnum {
    No = 0,
    Yes = "YES",
}

/* Computed and constant members */

//  An enum member is considered constant if:

enum E {
    X,
}

// All enum members in 'E1' and 'E2' are constant.
enum E1 {
    X,
    Y,
    Z,
}

enum E2 {
    A = 1,
    B,
    C,
}

enum FileAccess {
    // constant members
    None,
    Read = 1 << 1,
    Write = 1 << 2,
    ReadWrite = Read | Write,
    // computed member
    G = "123".length,
}


/* Union enums and enum member types */

// enum members also become type.

enum ShapeKind {
    Circle,
    Square,
}

interface Circle {
    kind: ShapeKind.Circle;
    radius: number;
}

interface Square {
    kind: ShapeKind.Square;
    sideLength: number;
}

let C: Circle = {
    kind: ShapeKind.Square,
    // Type 'ShapeKind.Square' is not assignable to type 'ShapeKind.Circle'.
    radius: 100,
};

//  enum types themselves effectively become a union of each enum member. 

enum E3 {
    Foo,
    Bar,
}

function f(x: E) {
    if (x !== E3.Foo || x !== E3.Bar) {
        // This condition will always return 'true' since the types 'E.Foo' and 'E.Bar' have no overlap.
    }
}

/* Enums at runtime */

enum E4 {
    X,
    Y,
    Z,
}

function f1(obj: { X: number }) {
    return obj.X;
}

// Works, since 'E' has a property named 'X' which is a number.
f1(E4);

/* Enums at compile time */

// an enum is compiled into an object that stores both forward (name -> value) and reverse (value -> name) mappings.

enum LogLevel {
    ERROR,
    WARN,
    INFO,
    DEBUG,
}

type LogLevelStrings = keyof typeof LogLevel;

function printImportant(key: LogLevelStrings, message: string) {
    const num = LogLevel[key];
    if (num <= LogLevel.WARN) {
        console.log("Log level key is:", key);  // "ERROR"
        console.log("Log level value is:", num); // "0"
        console.log("Log level message is:", message);
    }
}
printImportant("ERROR", "This is a message");



enum Enum {
    A,
}

let q = Enum.A;
let nameOfA = Enum[q]; // "A"

/* const enums */

const enum Enum1 {
    A = 1,
    B = A * 2,
}

/* Ambient enums */

declare enum Enum2 {
    A = 1,
    B,
    C = 2,
}

