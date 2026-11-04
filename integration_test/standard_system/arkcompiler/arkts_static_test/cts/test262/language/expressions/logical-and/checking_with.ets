/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.11.1_A2.4_T1
// description: logical AND evaluates operands left to right

function main(): void {
    let x: boolean = false;
    arktest.assertTrue(((x = true) && x) === true);

    x = false;
    arktest.assertFalse((x && (x = true)) === true);
    arktest.assertFalse(x);
}
