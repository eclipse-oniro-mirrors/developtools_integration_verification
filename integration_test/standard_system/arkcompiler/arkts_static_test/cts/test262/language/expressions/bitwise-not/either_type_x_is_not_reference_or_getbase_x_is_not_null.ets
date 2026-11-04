/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.4.8_A2.1_T1
// description: bitwise not conversion semantics

class BitwiseNotValue {
    public prop: int = 0;
}

function main(): void {
    let x: int = 0;
    let valueObject = new BitwiseNotValue();
    arktest.assertEQ(~0, -1);
    arktest.assertEQ(~(~0), 0);
    arktest.assertEQ(~x, -1);
    arktest.assertEQ(~(~x), 0);
    arktest.assertEQ(~valueObject.prop, -1);
}
