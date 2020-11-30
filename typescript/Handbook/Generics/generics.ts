function identity<T>(arg: T): T {
    return arg;
}

let output = identity<string>("myString");


function loggingIdentity<T>(arg: T[]): T[] {
    console.log(arg.length);
    return arg;
}

function loggingIdentity1<T>(arg: Array<T>): Array<T> {
    console.log(arg.length); // Array has a .length, so no more error
    return arg;
}

/* Generic Types */

let myIdentity: <T>(arg: T) => T = identity;


interface GenericIdentityFn {
    <T>(arg: T): T;
}

let myIdentity1: GenericIdentityFn = identity;


let myIdentity3: { <T>(arg: T): T } = identity;


interface GenericIdentityFn1<T> {
    (arg: T): T;
}

let myIdentity4: GenericIdentityFn1<number> = identity;

/* Generic Class */

class GEnericNumber<T> {
    zeroValue: T;
    add: (x: T, y: T) => T
}

let myGenericNumber = new GEnericNumber<number>();
myGenericNumber.zeroValue = 0;
myGenericNumber.add = function (x, y) {
    return x + y;
}

/* Genric Constraints */

interface Lengthwise {
    length: number;
}

function loggingIdentity2<T extends Lengthwise>(arg: T): T {
    console.log(arg.length); // Now we know it has a .length property, so no more error
    return arg;
}

loggingIdentity2({ length: 10, value: 3 });

/* Using Type Parameters in Generic Constraints */

function getProperty<T, K extends keyof T>(obj: T, key: K) {
    return obj[key];
}

let xx = { a: 1, b: 2, c: 3, d: 4 };

getProperty(xx, "a");
getProperty(xx, "m");

/* Using Class Types in Generics */



class BeeKeeper {
    hasMask: boolean;
}

class ZooKeeper {
    nametag: string;
}

class Animals {
    numLegs: number;
}

class Bee extends Animals {
    keeper: BeeKeeper;
}

class Lion extends Animals {
    keeper: ZooKeeper;
}

function createInstance<A extends Animals>(c: new () => A): A {
    return new c();
}

createInstance(Lion).keeper.nametag;
createInstance(Bee).keeper.hasMask;