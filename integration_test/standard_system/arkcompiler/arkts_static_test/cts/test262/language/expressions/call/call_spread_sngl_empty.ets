/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-sngl-empty
// description: spreading an empty array contributes zero arguments
// source: call/spread-sngl-empty.js (`f(...[])`)

function f(...values: number[]): void {
    arktest.assertEQ(values.length, 0);
}

function main(): void {
    f(...[]);
}
