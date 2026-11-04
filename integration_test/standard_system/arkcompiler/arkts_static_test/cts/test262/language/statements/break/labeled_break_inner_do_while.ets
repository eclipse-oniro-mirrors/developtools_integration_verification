/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: labeled_break_inner_do_while
// description: A labeled break exits the inner do-while loop

function main(): void {
    let x: int = 0;
    let y: int = 0;
    inner: do {
        ++x;
        break inner;
        ++y;
    } while (false);
    arktest.assertEQ(x, 1);
    arktest.assertEQ(y, 0);
}
