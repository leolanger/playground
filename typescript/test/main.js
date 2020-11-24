var fst1 = function (a, b) { return a; };
var fst2 = function (a, b) { return a; };
var o = { n: 1, xs: [] };
// Gradual typing
var anys = [];
anys.push(1);
anys.push("oh no");
anys.push({ anything: "goes" });
anys.map(anys[1]);
var sepsis = anys[0] + anys[1];
// Structural typing
var o1 = { x: "hi", extra: 1 }; // ok
var o2 = o1; // ok
var Three = /** @class */ (function () {
    function Three() {
        this.p = "Hello";
    }
    return Three;
}());
var x = { p: "hi" };
var two = x;
two = new Three();
// Unions
function start(arg) {
    if (typeof arg === "string") {
        return commonCase(arg);
    }
    else if (Array.isArray(arg)) {
        return arg.map(commonCase).join(",");
    }
    else if (typeof arg === "function") {
        return commonCase(arg());
    }
    else {
        return commonCase(arg.s);
    }
    function commonCase(s) {
        // finally, just convert a string to another string
        return s;
    }
}
//# sourceMappingURL=main.js.map