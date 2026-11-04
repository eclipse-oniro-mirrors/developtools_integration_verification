/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: to_uint32_modulo
// description: Unsigned right shift computes results modulo 2^32

function main(): void {
    arktest.assertEQ(jsUint32(-2147483647 >>> 0), 2147483649);
    arktest.assertEQ(jsUint32(-2147483648 >>> 0), 2147483648);
    arktest.assertEQ(jsUint32(-2147483649 >>> 0), 2147483647);
    arktest.assertEQ(jsUint32(-4294967295 >>> 0), 1);
    arktest.assertEQ(jsUint32(-4294967296 >>> 0), 0);
    arktest.assertEQ(jsUint32(-4294967297 >>> 0), 4294967295);
    arktest.assertEQ(jsUint32(4294967296 >>> 0), 0);
    arktest.assertEQ(jsUint32(4294967297 >>> 0), 1);
}

function jsUint32(value: long): long {
    let normalized: long = value % 4294967296;
    if (normalized < 0) {
        normalized += 4294967296;
    }
    return normalized;
}
