/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.8.2_A2.1_T1
// description: operator uses GetValue for typed operands

class ComparisonOperandBox {
    public prop: int = 0;
}

function main(): void {
    arktest.assertTrue(2 > 1);

    let x: int = 2;
    arktest.assertTrue(x > 1);

    let y: int = 1;
    arktest.assertTrue(2 > y);
    arktest.assertTrue(x > y);

    let objectx = new ComparisonOperandBox();
    let objecty = new ComparisonOperandBox();
    objectx.prop = 2;
    objecty.prop = 1;
    arktest.assertTrue(objectx.prop > objecty.prop);
}
