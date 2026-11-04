/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.10.1_A2.1_T1
// description: bitwise and evaluates integer references with GetValue

class BitwiseAndValue {
    public prop: int = 1;
}

function main(): void {
    let x: int = 1;
    let y: int = 1;
    let objectx = new BitwiseAndValue();
    let objecty = new BitwiseAndValue();
    arktest.assertEQ(1 & 1, 1);
    arktest.assertEQ(x & 1, 1);
    arktest.assertEQ(1 & y, 1);
    arktest.assertEQ(x & y, 1);
    arktest.assertEQ(objectx.prop & objecty.prop, 1);
}
