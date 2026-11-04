/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: assignment_evaluation_order
// description: Right shift evaluates operands from left to right

function main(): void {
    let x: int = 0;
    arktest.assertEQ((x = 1) >> x, 0);
    x = -4;
    arktest.assertEQ(x >> (x = 1), -2);
}
