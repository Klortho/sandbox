"use strict";


//-------------------------------------------------
console.log("Block-scope");

//i = 0;        //=> ERROR; no hoisting (this wouldn't be an error
                //   if we'd used `var` below)

for (let i = 0; i < 3; i++) {
    console.log(i);
}
console.log(typeof i == "undefined");    //=> true

let callbacks = []
for (let i = 0; i <= 2; i++) {
    // These functions close around the block-scoped variables
    callbacks[i] = function () { return i * 2 }
}
console.log(callbacks[2]());    //=> 4

//-------------------------------------------------
console.log("Template literals / string interpolation");

var customer = { name: "Foo" };
var card = { amount: 7, product: "Bar", unitprice: 42 };
console.log(`Hello ${customer.name},
want to buy ${card.amount} ${card.product} for
a total of ${card.amount * card.unitprice} bucks?`);
