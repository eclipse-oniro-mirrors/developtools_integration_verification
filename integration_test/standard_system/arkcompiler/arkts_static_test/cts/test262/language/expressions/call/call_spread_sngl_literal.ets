/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-sngl-literal
// description: array spread of an array literal in a call; callee has a rest parameter
// source: call/spread-sngl-literal.js (`f(...[3,4,5])`)

function f(...values: number[]): void {
    arktest.assertEQ(values.length, 3);
    arktest.assertEQ(values[0], 3);
    arktest.assertEQ(values[1], 4);
    arktest.assertEQ(values[2], 5);
}

function main(): void {
    f(...[3, 4, 5]);
}
