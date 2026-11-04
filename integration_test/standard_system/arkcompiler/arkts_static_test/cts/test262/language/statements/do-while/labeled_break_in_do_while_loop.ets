/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: labeled_break_in_do_while_loop
// description: A labeled break exits a surrounding do-while block

function main(): void {
    let index: int = 0;
    target: do {
        ++index;
        if (index == 10) {
            break target;
        }
    } while (true);
    arktest.assertEQ(index, 10);
}
