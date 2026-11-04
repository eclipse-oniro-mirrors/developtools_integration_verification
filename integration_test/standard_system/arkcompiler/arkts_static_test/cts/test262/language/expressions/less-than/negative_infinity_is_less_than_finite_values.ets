/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: negative_infinity_is_less_than_finite_values
// description: Negative infinity is less than finite values

function main(): void {
    arktest.assertTrue(Number.NEGATIVE_INFINITY < 0);
    arktest.assertTrue(Number.NEGATIVE_INFINITY < 1.1);
    arktest.assertTrue(Number.NEGATIVE_INFINITY < -1.1);
    arktest.assertTrue(Number.NEGATIVE_INFINITY < Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.NEGATIVE_INFINITY < Number.MAX_VALUE);
    arktest.assertTrue(Number.NEGATIVE_INFINITY < Number.MIN_VALUE);
}
