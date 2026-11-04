/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.13.2_A2.1_T1.1
// description: compound assignment returns the assigned multiplication result

function main(): void {
    let x: int = 1;
    let z: int = (x *= -1);
    arktest.assertEQ(z, -1);
    arktest.assertEQ(x, -1);

    x = 1;
    let y: int = -1;
    z = (x *= y);
    arktest.assertEQ(z, -1);
    arktest.assertEQ(x, -1);
}
