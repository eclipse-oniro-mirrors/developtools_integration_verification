/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: parenthesized_rest_block_return
// description: A parenthesized arrow parameter list may contain a rest parameter

function main(): void {
    let af = (...x: int[]): int => {
        return x.length;
    };
    arktest.assertEQ(af(1, 1, 1), 3);
}
