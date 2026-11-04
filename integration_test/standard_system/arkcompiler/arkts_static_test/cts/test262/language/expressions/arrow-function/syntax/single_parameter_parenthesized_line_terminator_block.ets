/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: single_parameter_parenthesized_line_terminator_block
// description: A parenthesized arrow parameter list may have a line terminator before its block body

function main(): void {
    let af = (x: int): int => {
        return x;
    };
    arktest.assertEQ(af(1), 1);
}
