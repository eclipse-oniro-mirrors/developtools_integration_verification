/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: break_with_line_terminator
// description: A line terminator before the semicolon does not change unlabeled break

function main(): void {
    let sum: int = 0;
    for (let index: int = 1; index <= 10; ++index) {
        if (index == 6) {
            break
            ;
        }
        sum += index;
    }
    arktest.assertEQ(sum, 15);
}
