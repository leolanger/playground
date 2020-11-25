// Named function
function add(x, y) {
    return x + y;
}

// Anonymous function
let myAdd = function (x, y) {
    return x + y;
};

let z0 = 100;

function addToZ(x, y) {
    return x + y + z0;
}

/* Function TYpes */

function add1(x: number, y: number): number {
    return x + y;
}

let myAdd1: (x: number, y: number) => number = function (
    x: number,
    y: number
): number {
    return x + y;
}

// inferring the type
let myAdd2: (baseValue: number, increment: number) => number = function (x, y) {
    return x + y;
};

/* Optional and Default Parameters*/


// eg 1.
function buildName1(firstName: string, lastName: string) {
    return firstName + " " + lastName;
}
// let result1 = buildName("Bob"); // error, too few parameters
// let result2 = buildName("Bob", "Adams", "Sr."); // error, too many
let result = buildName1("Bob", "Adams"); // ah, just right


// eg 2.
function buildName2(firstName: string, lastName?: string) {
    if (lastName) return firstName + " " + lastName;
    else return firstName;
}

let result1 = buildName2("Bob"); // works correctly now
// let result2 = buildName2("Bob", "Adams", "Sr."); // error, too many parameters
let result3 = buildName2("Bob", "Adams"); // ah, just right


// eg 3.
function buildName3(firstName: string, lastName = "Smith") {
    return firstName + " " + lastName;
}

let result0 = buildName3("Bob"); // works correctly now, returns "Bob Smith"
let result2 = buildName3("Bob", undefined); // still works, also returns "Bob Smith"
// let result3 = buildName3("Bob", "Adams", "Sr."); // error, too many parameters
let result4 = buildName3("Bob", "Adams"); // ah, just right, returns "Bob Adams"


//eg 4.

function buildName4(firstName = "Will", lastName: string) {
    return firstName + " " + lastName;
}

// let resulta = buildName4("Bob"); // error, too few parameters
// let resultb = buildName4("Bob", "Adams", "Sr."); // error, too many parameters
let resultc = buildName4("Bob", "Adams"); // okay and returns "Bob Adams"
let resultd = buildName4(undefined, "Adams"); // okay and returns "Will Adams"


/* Rest Parameters */

function buildName(firstName: string, ...restOfName: string[]) {
    return firstName + " " + restOfName.join(" ");
}

// employeeName will be "Joseph Samuel Lucas MacKinzie"
let employeeName = buildName("Joseph", "Samuel", "Lucas", "MacKinzie");

let buildNameFun: (fname: string, ...rest: string[]) => string = buildName;


/* This */

let deck = {
    suits: ["hearts", "spades", "clubs", "diamonds"],
    cards: Array(52),
    createCardPicker: function () {
        return function () {
            let pickedCard = Math.floor(Math.random() * 52);
            let pickedSuit = Math.floor(pickedCard / 13);

            return { suit: this.suits[pickedSuit], card: pickedCard % 13 };
        };
    },
};

let cardPicker = deck.createCardPicker();
let pickedCard = cardPicker();

alert("card: " + pickedCard.card + " of " + pickedCard.suit);



interface Card {
    suit: string;
    card: number;
}

interface Deck {
    suits: string[];
    cards: number[];
    createCardPicker(this: Deck): () => Card;
}

let deck1: Deck = {
    suits: ["hearts", "spades", "clubs", "diamonds"],
    cards: Array(52),
    // NOTE: The function now explicitly specifies that its callee must be of type Deck
    createCardPicker: function (this: Deck) {
        return () => {
            let pickedCard = Math.floor(Math.random() * 52);
            let pickedSuit = Math.floor(pickedCard / 13);

            return { suit: this.suits[pickedSuit], card: pickedCard % 13 };
        };
    },
};

let cardPicker1 = deck.createCardPicker();
let pickedCard1 = cardPicker();

alert("card: " + pickedCard.card + " of " + pickedCard.suit);



/* Overloads */


let suits = ["hearts", "spades", "clubs", "diamonds"];

function pickCard(x: { suit: string; card: number }[]): number;
function pickCard(x: number): { suit: string; card: number };
function pickCard(x: any): any {
    // Check to see if we're working with an object/array
    // if so, they gave us the deck and we'll pick the card
    if (typeof x == "object") {
        let pickedCard = Math.floor(Math.random() * x.length);
        return pickedCard;
    }
    // Otherwise just let them pick the card
    else if (typeof x == "number") {
        let pickedSuit = Math.floor(x / 13);
        return { suit: suits[pickedSuit], card: x % 13 };
    }
}

let myDeck = [
    { suit: "diamonds", card: 2 },
    { suit: "spades", card: 10 },
    { suit: "hearts", card: 4 },
];

let pickedCard0 = myDeck[pickCard(myDeck)];
alert("card: " + pickedCard0.card + " of " + pickedCard0.suit);

let pickedCard2 = pickCard(15);
alert("card: " + pickedCard2.card + " of " + pickedCard2.suit);