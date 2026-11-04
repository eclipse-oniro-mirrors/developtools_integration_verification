/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: return_stops_execution
// description: Code after a return statement is not evaluated

let x1: int = 1;

function first(): void {
    x1++;
    return;
    x1 *= 2;
}

let x2: int = 1;

function second(): int {
    x2++;
    return x2;
    x2 *= 2;
}

let x3: int = 1;

function third(): void {
    x3++;
    return;
    return;
    x3 *= 2;
}

function main(): void {
    first();
    arktest.assertEQ(x1, 2);

    second();
    arktest.assertEQ(x2, 2);

    third();
    arktest.assertEQ(x3, 2);
}
