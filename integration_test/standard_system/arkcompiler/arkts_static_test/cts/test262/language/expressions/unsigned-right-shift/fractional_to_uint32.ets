/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: fractional_to_uint32
// description: Unsigned right shift truncates fractional numeric operands

function main(): void {
    arktest.assertEQ(jsUint32(1.2345 >>> 0), 1);
    arktest.assertEQ(jsUint32(-5.4321 >>> 0), 4294967291);
}

function jsUint32(value: long): long {
    let normalized: long = value % 4294967296;
    if (normalized < 0) {
        normalized += 4294967296;
    }
    return normalized;
}
