/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: for_body_before_throwing_update
// description: A for-loop body executes before an exception in its update expression

function throwFromUpdate(): int {
    throw new Error('second expression');
}

function main(): void {
    let reached: boolean = false;
    arktest.expectThrow(() => {
        for (; true; throwFromUpdate()) {
            reached = true;
        }
    }, (e: Error) => e.name == 'Error');
    arktest.assertTrue(reached);
}
