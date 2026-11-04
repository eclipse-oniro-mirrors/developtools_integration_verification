/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: parenthesized_rest_line_terminator_block
// description: A rest parameter arrow function may have a line terminator before its block body

function main(): void {
    let af = (...x: int[]) => {
        return x.length;
    };
    arktest.assertEQ(af(1, 1, 1), 3);
}
