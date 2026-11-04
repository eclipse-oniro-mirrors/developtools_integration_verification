/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: assignment_evaluation_order
// description: Greater-than evaluates operands from left to right

function main(): void {
    let x: int = 0;
    arktest.assertFalse((x = 1) > x);
    x = 1;
    arktest.assertTrue(x > (x = 0));
}
