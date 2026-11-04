/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-mult-empty
// description: a trailing empty spread adds nothing after explicit arguments
// source: call/spread-mult-empty.js (`f(1,2,3,...[])`)

function f(...values: number[]): void {
    arktest.assertEQ(values.length, 3);
    arktest.assertEQ(values[0], 1);
    arktest.assertEQ(values[1], 2);
    arktest.assertEQ(values[2], 3);
}

function main(): void {
    f(1, 2, 3, ...[]);
}
