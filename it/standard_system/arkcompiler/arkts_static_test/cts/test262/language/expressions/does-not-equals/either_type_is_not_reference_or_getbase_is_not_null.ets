/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.2_A2.1_T1
// description: operator != uses GetValue for typed operands

class ComparisonOperandBox {
    public prop: int = 0;
}

function main(): void {
    arktest.assertFalse(1 != 1);

    let x: int = 1;
    arktest.assertFalse(x != 1);

    let y: int = 1;
    arktest.assertFalse(1 != y);
    arktest.assertFalse(x != y);

    let objectx = new ComparisonOperandBox();
    let objecty = new ComparisonOperandBox();
    objectx.prop = 1;
    objecty.prop = 1;
    arktest.assertFalse(objectx.prop != objecty.prop);
}
