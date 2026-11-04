/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.6.2_A2.1_T1
// description: operator uses GetValue for typed operands

class ComparisonOperandBox {
    public prop: int = 0;
}

function main(): void {
    arktest.assertEQ(1 - 1, 0);

    let x: int = 1;
    arktest.assertEQ(x - 1, 0);

    let y: int = 1;
    arktest.assertEQ(1 - y, 0);
    arktest.assertEQ(x - y, 0);

    let objectx = new ComparisonOperandBox();
    let objecty = new ComparisonOperandBox();
    objectx.prop = 1;
    objecty.prop = 1;
    arktest.assertEQ(objectx.prop - objecty.prop, 0);
}
