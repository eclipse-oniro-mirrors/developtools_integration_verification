/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: nested_labeled_continue
// description: A labeled continue targets the outer loop from a nested loop

function main(): void {
    let count: int = 0;
    outer: for (let x: int = 0; x < 10;) {
        ++x;
        for (let y: int = 0; y < 2;) {
            ++y;
            ++count;
            if (y == 2) {
                continue outer;
            }
        }
    }
    arktest.assertEQ(count, 20);
}
