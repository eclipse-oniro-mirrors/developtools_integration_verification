/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: labeled_continue
// description: A labeled continue targets the enclosing for loop

function main(): void {
    let count: int = 0;
    label: for (let x: int = 0; x < 10;) {
        while (true) {
            ++x;
            ++count;
            continue label;
        }
    }
    arktest.assertEQ(count, 10);
}
