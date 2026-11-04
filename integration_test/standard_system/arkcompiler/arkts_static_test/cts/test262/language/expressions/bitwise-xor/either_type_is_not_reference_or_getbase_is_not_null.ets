/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.10.2_A2.1_T1
// description: bitwise xor evaluation order

class BitwiseValue {
    public prop: int = 1;
}

function main(): void {
    let x: int = 1;
    let y: int = 1;
    let valueX = new BitwiseValue();
    let valueY = new BitwiseValue();
    arktest.assertEQ(1 ^ 1, 0);
    arktest.assertEQ(x ^ 1, 0);
    arktest.assertEQ(1 ^ y, 0);
    arktest.assertEQ(x ^ y, 0);
    arktest.assertEQ(valueX.prop ^ valueY.prop, 0);
}
