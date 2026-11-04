/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: return_without_expression_line_terminator
// description: A return statement without an expression may have a line terminator before its semicolon

let sum: int = 0;

function innerTest(): void {
    for (let i: int = 1; i <= 10; i++) {
        if (i === 6) {
            return
            ;
        }
        sum += i;
    }
}

function main(): void {
    innerTest();
    arktest.assertEQ(sum, 15);
}
