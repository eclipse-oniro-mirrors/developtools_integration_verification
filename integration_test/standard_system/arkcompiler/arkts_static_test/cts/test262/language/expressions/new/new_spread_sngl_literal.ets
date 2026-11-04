/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-sngl-literal
// description: array-literal spread into a new-expression argument list
// source: new/spread-sngl-literal.js (`new C(...[3,4,5])`)

class SinkSpread {
    public values: number[];
    constructor(...values: number[]) {
        this.values = values;
    }
}

function main(): void {
    let inst: SinkSpread = new SinkSpread(...[3, 4, 5]);
    arktest.assertEQ(inst.values.length, 3);
    arktest.assertEQ(inst.values[0], 3);
    arktest.assertEQ(inst.values[1], 4);
    arktest.assertEQ(inst.values[2], 5);
}