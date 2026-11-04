/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0.
 */
// arktsid: compound_assignment_or_statement
// description: Compound bitwise-or assignment updates a variable
function main(): void {
    let x: int = 0;
    x |= 1;
    arktest.assertEQ(x, 1);
    let y: int = 0;
    y = 1;
    y |= 0;
    arktest.assertEQ(y, 1);
}
