/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: empty_array_literal
// description: Evaluate the production ArrayLiteral [ ] — typeof/instanceof identity and length 0
// (check#3 array.toString === Array.prototype.toString excluded: ESE0087 Property
// 'prototype' does not exist on type 'Array' + ESY30818, verified 2026-08-17)

function main(): void {
    let array: number[] = [];
    arktest.assertEQ(typeof array, 'object');
    arktest.assertEQ(array instanceof Array, true);
    arktest.assertEQ(array.length, 0);
}
