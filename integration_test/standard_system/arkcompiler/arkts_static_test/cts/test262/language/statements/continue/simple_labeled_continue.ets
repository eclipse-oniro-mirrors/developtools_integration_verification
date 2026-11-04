/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: simple_labeled_continue
// description: A basic labeled for loop supports continue

function main(): void {
    let count: int = 0;
    label: for (let x: int = 0; x < 10;) {
        ++x;
        ++count;
        continue label;
    }
    arktest.assertEQ(count, 10);
}
