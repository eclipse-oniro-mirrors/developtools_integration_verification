/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: assignment_evaluation_order
// description: Less-than-or-equal evaluates operands from left to right

function main(): void {
    let x: int = 0;
    arktest.assertTrue((x = 1) <= x);
    x = 1;
    arktest.assertFalse(x <= (x = 0));
}
