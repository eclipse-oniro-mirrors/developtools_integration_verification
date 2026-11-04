/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: to_uint32_range
// description: Unsigned right shift converts values into the Uint32 range

function main(): void {
    arktest.assertEQ(jsUint32(0 >>> 0), 0);
    arktest.assertEQ(jsUint32(1 >>> 0), 1);
    arktest.assertEQ(jsUint32(-1 >>> 0), 4294967295);
    arktest.assertEQ(jsUint32(4294967295 >>> 0), 4294967295);
    arktest.assertEQ(jsUint32(4294967294 >>> 0), 4294967294);
    arktest.assertEQ(jsUint32(4294967296 >>> 0), 0);
}

function jsUint32(value: long): long {
    let normalized: long = value % 4294967296;
    if (normalized < 0) {
        normalized += 4294967296;
    }
    return normalized;
}
