/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: nan_right_operand_is_false
// description: Greater-than-or-equal is false when the right operand is NaN

function main(): void {
    let nan: double = Number.NaN;
    arktest.assertFalse(0 >= nan);
    arktest.assertFalse(1.1 >= nan);
    arktest.assertFalse(-1.1 >= nan);
    arktest.assertFalse(nan >= nan);
    arktest.assertFalse(Number.POSITIVE_INFINITY >= nan);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= nan);
    arktest.assertFalse(Number.MAX_VALUE >= nan);
    arktest.assertFalse(Number.MIN_VALUE >= nan);
}
