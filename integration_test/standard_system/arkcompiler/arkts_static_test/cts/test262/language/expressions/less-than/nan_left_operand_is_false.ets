/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: nan_left_operand_is_false
// description: Less-than is false when the left operand is NaN

function main(): void {
    let nan: double = Number.NaN;
    arktest.assertFalse(nan < 0);
    arktest.assertFalse(nan < 1.1);
    arktest.assertFalse(nan < -1.1);
    arktest.assertFalse(nan < nan);
    arktest.assertFalse(nan < Number.POSITIVE_INFINITY);
    arktest.assertFalse(nan < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(nan < Number.MAX_VALUE);
    arktest.assertFalse(nan < Number.MIN_VALUE);
}
