/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
// arktsid: compound_assignment_right_shift_statement
// description: Compound right shift assignment updates a variable
function main(): void {
    let x: int = 4;
    x >>= 1;
    arktest.assertEQ(x, 2);
    let y: int = 0;
    y = 4;
    y >>= 1;
    arktest.assertEQ(y, 2);
}
