/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: negative_infinity_is_not_greater_than_finite_values
// description: Negative infinity is not greater than or equal to finite values

function main(): void {
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= 0);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= 1.1);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= -1.1);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= Number.MAX_VALUE);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= Number.MIN_VALUE);
}
