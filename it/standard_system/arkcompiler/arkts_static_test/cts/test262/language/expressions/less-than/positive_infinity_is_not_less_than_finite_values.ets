/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: positive_infinity_is_not_less_than_finite_values
// description: Positive infinity is not less than finite values

function main(): void {
    arktest.assertFalse(Number.POSITIVE_INFINITY < 0);
    arktest.assertFalse(Number.POSITIVE_INFINITY < 1.1);
    arktest.assertFalse(Number.POSITIVE_INFINITY < -1.1);
    arktest.assertFalse(Number.POSITIVE_INFINITY < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(Number.POSITIVE_INFINITY < Number.MAX_VALUE);
    arktest.assertFalse(Number.POSITIVE_INFINITY < Number.MIN_VALUE);
}
