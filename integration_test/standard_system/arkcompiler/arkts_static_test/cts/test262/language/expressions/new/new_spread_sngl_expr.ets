/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-sngl-expr
// description: array spread into a new-expression constructor argument list; constructor has a rest parameter
// source: new/spread-sngl-expr.js (`new C(...target)` with target = [2,3,4])
// (fixed 2026-08-18: added missing `let target: number[] = [2,3,4]` declaration --
//  source has `target = source` where source = [2,3,4]; was ESE0143 unresolved. 待下轮 es2panda 复验)

class SinkSpread {
    public values: number[];
    constructor(...values: number[]) {
        this.values = values;
    }
}

function main(): void {
    let target: number[] = [2, 3, 4];
    let inst: SinkSpread = new SinkSpread(...target);
    arktest.assertEQ(inst.values.length, 3);
    arktest.assertEQ(inst.values[0], 2);
    arktest.assertEQ(inst.values[1], 3);
    arktest.assertEQ(inst.values[2], 4);
}