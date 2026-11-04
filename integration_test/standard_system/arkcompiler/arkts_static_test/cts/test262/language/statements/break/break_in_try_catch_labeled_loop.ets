/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: break_in_try_catch_labeled_loop
// description: A break in catch exits a labeled loop

function main(): void {
    let index: int = 0;
    loop: for (;;) {
        try {
            ++index;
            throw new Error('stop');
        } catch (error) {
            break loop;
        }
    }
    arktest.assertEQ(index, 1);
}
