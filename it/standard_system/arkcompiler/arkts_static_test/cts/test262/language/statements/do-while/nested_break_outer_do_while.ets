/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: nested_break_outer_do_while
// description: A labeled break exits an outer do-while from an inner loop

function main(): void {
    let outerBefore: boolean = false;
    let innerBefore: boolean = false;
    let innerAfter: boolean = false;
    let outerAfter: boolean = false;
    outer: do {
        outerBefore = true;
        do {
            innerBefore = true;
            break outer;
            innerAfter = true;
        } while (false);
        outerAfter = true;
    } while (false);
    arktest.assertTrue(outerBefore);
    arktest.assertTrue(innerBefore);
    arktest.assertFalse(innerAfter);
    arktest.assertFalse(outerAfter);
}
