/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.10.2_A2.4_T1
// description: bitwise xor evaluation order

function main(): void {
    let x: int = 0;
    let first: int = (x = 1) ^ x;
    arktest.assertEQ(first, 0);
    x = 0;
    let second: int = x ^ (x = 1);
    arktest.assertEQ(second, 1);
}
