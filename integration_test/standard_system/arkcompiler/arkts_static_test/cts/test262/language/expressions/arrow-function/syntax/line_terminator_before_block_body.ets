/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: line_terminator_before_block_body
// description: A line terminator may appear between an arrow and its block body

function main(): void {
    let af = (x: int): int => {
        return x;
    };
    arktest.assertEQ(af(1), 1);
}
