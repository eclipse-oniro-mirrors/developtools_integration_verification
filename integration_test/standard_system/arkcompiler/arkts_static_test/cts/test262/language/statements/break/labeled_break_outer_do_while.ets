/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: labeled_break_outer_do_while
// description: A labeled break exits the outer do-while from its nested loop

function main(): void {
    let outerValue: int = 0;
    let innerValue: int = 0;
    outer: do {
        outerValue = 1;
        inner: do {
            innerValue = 1;
            break outer;
        } while (false);
        outerValue = 2;
    } while (false);
    arktest.assertEQ(outerValue, 1);
    arktest.assertEQ(innerValue, 1);
}
