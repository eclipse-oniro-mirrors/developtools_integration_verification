/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-mult-expr
// description: preceding arguments followed by a spread into a new-expression
// source: new/spread-mult-expr.js (`new C(1,2,...source)` with source = [3,4,5])
// (fixed 2026-08-18: added missing `let source: number[] = [3,4,5]` declaration --
//  source has `source = [3,4,5]`; was ESE0143 unresolved. 待下轮 es2panda 复验)

class SinkSpread {
    public values: number[];
    constructor(...values: number[]) {
        this.values = values;
    }
}

function main(): void {
    let source: number[] = [3, 4, 5];
    let inst: SinkSpread = new SinkSpread(1, 2, ...source);
    arktest.assertEQ(inst.values.length, 5);
    arktest.assertEQ(inst.values[0], 1);
    arktest.assertEQ(inst.values[1], 2);
    arktest.assertEQ(inst.values[2], 3);
    arktest.assertEQ(inst.values[3], 4);
    arktest.assertEQ(inst.values[4], 5);
}