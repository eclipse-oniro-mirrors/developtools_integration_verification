/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-mult-empty
// description: a trailing empty spread after explicit constructor arguments
// source: new/spread-mult-empty.js (`new C(1,2,3,...[])`)

class SinkSpread {
    public values: number[];
    constructor(...values: number[]) {
        this.values = values;
    }
}

function main(): void {
    let inst: SinkSpread = new SinkSpread(1, 2, 3, ...[]);
    arktest.assertEQ(inst.values.length, 3);
    arktest.assertEQ(inst.values[0], 1);
    arktest.assertEQ(inst.values[1], 2);
    arktest.assertEQ(inst.values[2], 3);
}