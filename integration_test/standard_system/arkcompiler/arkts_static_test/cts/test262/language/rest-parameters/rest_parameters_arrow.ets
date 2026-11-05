/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: rest-parameters-arrow
// description: arrow functions support rest parameters; the rest parameter collects all trailing arguments into an
// array
// source: rest-parameters/arrow-function.js (`(a,b,...c) => c`)

function main(): void {
    let fn = (a: number, b: number, ...c: number[]): number[] => c;
    arktest.assertEQ(fn(1, 2).length, 0);
    arktest.assertEQ(fn(1, 2, 3).length, 1);
    arktest.assertEQ(fn(1, 2, 3)[0], 3);
    arktest.assertEQ(fn(1, 2, 3, 4).length, 2);
    arktest.assertEQ(fn(1, 2, 3, 4, 5).length, 3);
    arktest.assertEQ(fn(1, 2, 3, 4, 5)[2], 5);
    let restOnly = (...args: number[]): number[] => args;
    arktest.assertEQ(restOnly().length, 0);
    arktest.assertEQ(restOnly(1, 2, 3).length, 3);
}