/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.13.2_A3.1_T1
// description: checking expression and variable statements for x *= y

function main(): void {
    let x: int = 1;
    x *= -1;
    arktest.assertEQ(x, -1);

    let y: int = 0;
    y = 1;
    y *= -1;
    arktest.assertEQ(y, -1);
}
