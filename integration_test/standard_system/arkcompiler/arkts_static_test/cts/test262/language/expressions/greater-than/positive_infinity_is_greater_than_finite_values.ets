/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: positive_infinity_is_greater_than_finite_values
// description: Positive infinity is greater than finite values

function main(): void {
    arktest.assertTrue(Number.POSITIVE_INFINITY > 0);
    arktest.assertTrue(Number.POSITIVE_INFINITY > 1.1);
    arktest.assertTrue(Number.POSITIVE_INFINITY > -1.1);
    arktest.assertTrue(Number.POSITIVE_INFINITY > Number.NEGATIVE_INFINITY);
    arktest.assertTrue(Number.POSITIVE_INFINITY > Number.MAX_VALUE);
    arktest.assertTrue(Number.POSITIVE_INFINITY > Number.MIN_VALUE);
}
