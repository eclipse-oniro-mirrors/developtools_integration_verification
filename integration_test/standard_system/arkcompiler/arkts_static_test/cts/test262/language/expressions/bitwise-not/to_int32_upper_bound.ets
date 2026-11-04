/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: to_int32_upper_bound
// description: Bitwise not wraps values at the signed Int32 boundary

function main(): void {
    arktest.assertEQ(jsBitwiseNot(2147483647), -2147483648);
    arktest.assertEQ(jsBitwiseNot(2147483648), jsBitwiseNot(-2147483648));
    arktest.assertEQ(jsBitwiseNot(2147483649), jsBitwiseNot(-2147483647));
    arktest.assertEQ(jsBitwiseNot(4294967295), jsBitwiseNot(-1));
    arktest.assertEQ(jsBitwiseNot(4294967296), jsBitwiseNot(0));
    arktest.assertEQ(jsBitwiseNot(4294967297), jsBitwiseNot(1));
}

function jsBitwiseNot(value: long): long {
    let normalized: long = value % 4294967296;
    if (normalized < 0) {
        normalized += 4294967296;
    }
    if (normalized >= 2147483648) {
        normalized -= 4294967296;
    }
    return -normalized - 1;
}
