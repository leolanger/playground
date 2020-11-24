let fst1: (a: any, b: any) => any = (a, b) => a;

let fst2: <T, U>(a: T, b: U) => T = (a, b) => a;

let o: { n: number; xs: object[] } = { n: 1, xs: [] };

// Gradual typing

const anys = [];
anys.push(1);
anys.push("oh no");
anys.push({ anything: "goes" });
anys.map(anys[1]);

let sepsis = anys[0] + anys[1];

// Structural typing

let o1 = { x: "hi", extra: 1 }; // ok
let o2: { x: string } = o1; // ok

type One = { p: string };
interface Two {
    p: string;
}
class Three {
    p = "Hello";
}

let x: One = { p: "hi" };
let two: Two = x;
two = new Three();

// Unions

function start(
    arg: string | string[] | (() => string) | { s: string }
): string {
    if (typeof arg === "string") {
        return commonCase(arg);
    } else if (Array.isArray(arg)) {
        return arg.map(commonCase).join(",");
    } else if (typeof arg === "function") {
        return commonCase(arg());
    } else {
        return commonCase(arg.s);
    }

    function commonCase(s: string): string {
        // finally, just convert a string to another string
        return s;
    }
}

// intersections

type Combined = { a: number } & { b: string };
type Conflicting = { a: number } & { a: string };

// Unit types

declare function pad(s: string, n: number, direction: "left" | "right"): string;
pad("hi", 10, "left");

// let s = "right";
// pad("hi", 10, s); // error: 'string' is not assignable to '"left" | "right"'

let s: "left" | "right" = "left";
pad("hi", 10, s);

// Contextual type

let s1 = "I'm a string";    // TypeScript has some obvious places where it can infer types



declare function map<T, U>(f: (t: T) => U, ts: T[]): U[];
let sns = map((n) => n.toString, [1, 2, 3]);

declare function map<T, U>(ts: T[], f: (t: T) => U): U[]

declare function run<T>(thunk: (t: T) => void): T;
let i: { inference: string } = run((o) => {
    o.inference = "INSERT STATE HERE";
});

// type alias

type Size = [number, number];
let x2: Size = [101.1, 999.9];

type FString = string & { __compileTimeOnly: any };

// Discriminated Unions

type Shape =
    | { kind: "circle"; radius: number }
    | { kind: "square"; x: number }
    | { kind: "triangle"; x: number; y: number }

function area(s: Shape) {
    if (s.kind === "circle") {
        return Math.PI * s.radius * s.radius;
    } else if (s.kind === "square") {
        return s.x * s.x;
    } else {
        return (s.x * s.y) / 2;
    }
}

function height(s: Shape) {
    if (s.kind === "circle") {
        return 2 * s.radius;
    } else {
        // s.kind: "square" | "triangle"
        return s.x;
    }
}

// type parameters

function liftArray<T>(t: T): Array<T> {
    return [t];
}

function firstish<T extends { length: number }>(t1: T, t2: T): T {
    return t1.length > t2.length ? t1 : t2;
}

// Module system

/*
import { value, Type } from "npm-package";
import { other, Types } from "./local-package";
import * as prefix from "../lib/third-package";

import f = require("single-function-package");

export { f };

function f() {
  return g();
}
function g() {} // g is not exported

export function f { return g() }
function g() { }
*/

// readonly and const

const a = [1, 2, 3];
a.push(102); // ):
a[0] = 101; // D:

/*
interface Rx {
    readonly x: number;
}
let rx: Rx = { x: 1 };
rx.x = 12; // error
*/

/*
interface X {
  x: number;
}
let rx: Readonly<X> = { x: 1 };
rx.x = 12; // error
*/

/*
let a: ReadonlyArray<number> = [1, 2, 3];
let b: readonly number[] = [1, 2, 3];
a.push(102); // error
b[0] = 101; // error
*/

/*
let a = [1, 2, 3] as const;
a.push(102); // error
a[0] = 101; // error
*/

