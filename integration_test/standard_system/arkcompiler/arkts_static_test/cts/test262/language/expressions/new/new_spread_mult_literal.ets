/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-mult-literal
// description: a spread sandwiched between explicit constructor arguments
// source: new/spread-mult-literal.js (`new C(5,...[6,7,8],9)`)

class SinkSpread {
    public values: number[];
    constructor(...values: number[]) {
        this.values = values;
    }
}

function main(): void {
    let inst: SinkSpread = new SinkSpread(5, ...[6, 7, 8], 9);
    arktest.assertEQ(inst.values.length, 5);
    arktest.assertEQ(inst.values[0], 5);
    arktest.assertEQ(inst.values[1], 6);
    arktest.assertEQ(inst.values[2], 7);
    arktest.assertEQ(inst.values[3], 8);
    arktest.assertEQ(inst.values[4], 9);
}