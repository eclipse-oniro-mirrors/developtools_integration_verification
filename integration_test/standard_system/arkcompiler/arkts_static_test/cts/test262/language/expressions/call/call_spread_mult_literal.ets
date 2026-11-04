/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-mult-literal
// description: a spread sandwiched between explicit arguments in a call
// source: call/spread-mult-literal.js (`f(5,...[6,7,8],9)`)

function f(...values: number[]): void {
    arktest.assertEQ(values.length, 5);
    arktest.assertEQ(values[0], 5);
    arktest.assertEQ(values[1], 6);
    arktest.assertEQ(values[2], 7);
    arktest.assertEQ(values[3], 8);
    arktest.assertEQ(values[4], 9);
}

function main(): void {
    f(5, ...[6, 7, 8], 9);
}
