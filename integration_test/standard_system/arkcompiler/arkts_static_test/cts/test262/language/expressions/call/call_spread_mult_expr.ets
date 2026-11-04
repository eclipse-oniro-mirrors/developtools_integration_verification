/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-mult-expr
// description: preceding arguments followed by a spread expand to a single argument list
// source: call/spread-mult-expr.js (`f(1,2,...source)` with source = [3,4,5])

function f(...values: number[]): void {
    arktest.assertEQ(values.length, 5);
    arktest.assertEQ(values[0], 1);
    arktest.assertEQ(values[1], 2);
    arktest.assertEQ(values[2], 3);
    arktest.assertEQ(values[3], 4);
    arktest.assertEQ(values[4], 5);
}

function main(): void {
    let source: number[] = [3, 4, 5];
    f(1, 2, ...source);
}
