/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.7.3_A2.1_T1
// description: operator uses GetValue for typed integer operands

class ShiftOperandBox {
    public prop: int = 0;
}

function main(): void {
    arktest.assertEQ(-4 >>> 1, 2147483646);

    let x: int = -4;
    arktest.assertEQ(x >>> 1, 2147483646);

    let y: int = 1;
    arktest.assertEQ(-4 >>> y, 2147483646);

    x = -4;
    arktest.assertEQ(x >>> y, 2147483646);

    let objectx = new ShiftOperandBox();
    let objecty = new ShiftOperandBox();
    objectx.prop = -4;
    objecty.prop = 1;
    arktest.assertEQ(objectx.prop >>> objecty.prop, 2147483646);
}
