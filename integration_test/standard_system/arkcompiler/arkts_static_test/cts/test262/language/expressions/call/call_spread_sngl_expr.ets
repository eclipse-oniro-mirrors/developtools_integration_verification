/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-sngl-expr
// description: array spread in a call expands the array into arguments; ArkTS requires the callee to declare a rest
// parameter
// source: call/spread-sngl-expr.js (`f(...target)` with target = [2,3,4])

function f(...values: number[]): void {
    arktest.assertEQ(values.length, 3);
    arktest.assertEQ(values[0], 2);
    arktest.assertEQ(values[1], 3);
    arktest.assertEQ(values[2], 4);
}

function main(): void {
    let target: number[] = [2, 3, 4];
    f(...target);
}