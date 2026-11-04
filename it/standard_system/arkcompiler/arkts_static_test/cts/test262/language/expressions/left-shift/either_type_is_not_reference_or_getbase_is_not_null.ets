/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.7.1_A2.1_T1
// description: operator uses GetValue for typed integer operands

class ShiftOperandBox {
    public prop: int = 0;
}

function main(): void {
    arktest.assertEQ(2 << 1, 4);

    let x: int = 2;
    arktest.assertEQ(x << 1, 4);

    let y: int = 1;
    arktest.assertEQ(2 << y, 4);

    x = 2;
    arktest.assertEQ(x << y, 4);

    let objectx = new ShiftOperandBox();
    let objecty = new ShiftOperandBox();
    objectx.prop = 2;
    objecty.prop = 1;
    arktest.assertEQ(objectx.prop << objecty.prop, 4);
}
