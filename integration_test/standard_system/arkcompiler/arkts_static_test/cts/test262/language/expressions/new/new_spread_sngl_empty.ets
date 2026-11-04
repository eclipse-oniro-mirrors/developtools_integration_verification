/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: spread-sngl-empty
// description: spreading an empty array into a new-expression passes zero constructor arguments
// source: new/spread-sngl-empty.js (`new C(...[])`)

class SinkSpread {
    public values: number[];
    constructor(...values: number[]) {
        this.values = values;
    }
}

function main(): void {
    let inst: SinkSpread = new SinkSpread(...[]);
    arktest.assertEQ(inst.values.length, 0);
}