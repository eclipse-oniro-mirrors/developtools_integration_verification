/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
// arktsid: compound_assignment_left_shift_expression
// description: Compound left shift assignment returns the assigned value
function main(): void {
    let x: int = 1;
    let x1: int = x <<= 1;
    arktest.assertEQ(x1, 2);
    let y: int = 0;
    let y1: int = 0;
    y = 1;
    y1 = y <<= 1;
    arktest.assertEQ(y1, 2);
}
