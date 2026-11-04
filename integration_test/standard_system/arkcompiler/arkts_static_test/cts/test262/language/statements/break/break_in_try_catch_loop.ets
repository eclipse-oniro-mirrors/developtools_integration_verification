/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: break_in_try_catch_loop
// description: An unlabeled break in catch exits the current loop

function main(): void {
    let index: int = 0;
    for (;;) {
        try {
            ++index;
            throw new Error('stop');
        } catch (error) {
            break;
        }
    }
    arktest.assertEQ(index, 1);
}
