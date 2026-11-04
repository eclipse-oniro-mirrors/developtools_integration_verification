/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.10.3_A2.1_T1
// description: bitwise or evaluates integer references with GetValue

class BitwiseOrValue {
    public prop: int = 1;
}

function main(): void {
    let x: int = 1;
    let y: int = 1;
    let valueX = new BitwiseOrValue();
    let valueY = new BitwiseOrValue();
    arktest.assertEQ(1 | 1, 1);
    arktest.assertEQ(x | 1, 1);
    arktest.assertEQ(1 | y, 1);
    arktest.assertEQ(x | y, 1);
    arktest.assertEQ(valueX.prop | valueY.prop, 1);
}
