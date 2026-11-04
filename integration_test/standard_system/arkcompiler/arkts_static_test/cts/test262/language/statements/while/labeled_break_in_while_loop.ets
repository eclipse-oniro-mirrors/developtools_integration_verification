/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: labeled_break_in_while_loop
// description: A labeled break exits the surrounding while loop block

function main(): void {
    let index: int = 0;
    target: while (true) {
        ++index;
        if (index == 10) {
            break target;
        }
    }
    arktest.assertEQ(index, 10);
}
