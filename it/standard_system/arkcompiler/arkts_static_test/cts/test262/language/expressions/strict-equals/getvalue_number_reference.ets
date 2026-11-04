/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.4_A2.1_T1
// description: Either Type is not Reference or GetBase is not null

class StrictEqualsNumberHolder {
    public prop: int = 1;
}

function main(): void {
    arktest.assertEQ(1 === 1, true);

    let x: int = 1;
    arktest.assertEQ(x === 1, true);

    let y: int = 1;
    arktest.assertEQ(1 === y, true);
    arktest.assertEQ(x === y, true);

    let holderX = new StrictEqualsNumberHolder();
    let holderY = new StrictEqualsNumberHolder();
    arktest.assertEQ(holderX.prop === holderY.prop, true);
}
