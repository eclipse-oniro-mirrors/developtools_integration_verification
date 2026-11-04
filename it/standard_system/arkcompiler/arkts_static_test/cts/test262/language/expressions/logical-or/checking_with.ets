/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.11.2_A2.4_T1
// description: logical OR evaluates operands left to right

function main(): void {
    let x: boolean = true;
    arktest.assertFalse(((x = false) || x) === true);

    x = true;
    arktest.assertTrue((x || (x = false)) === true);
    arktest.assertTrue(x);
}
