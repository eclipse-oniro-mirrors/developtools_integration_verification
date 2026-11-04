/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.5_A2.1_T1
// description: Either Type is not Reference or GetBase is not null

class StrictDoesNotEqualNumberHolder {
    public prop: int = 1;
}

function main(): void {
    arktest.assertEQ(1 !== 1, false);

    let x: int = 1;
    arktest.assertEQ(x !== 1, false);

    let y: int = 1;
    arktest.assertEQ(1 !== y, false);
    arktest.assertEQ(x !== y, false);

    let holderX = new StrictDoesNotEqualNumberHolder();
    let holderY = new StrictDoesNotEqualNumberHolder();
    arktest.assertEQ(holderX.prop !== holderY.prop, false);
}
