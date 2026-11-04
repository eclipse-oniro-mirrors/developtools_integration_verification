/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: finite_values_are_greater_than_negative_infinity
// description: Finite values are greater than negative infinity

function main(): void {
    arktest.assertTrue(0 > Number.NEGATIVE_INFINITY);
    arktest.assertTrue(1.1 > Number.NEGATIVE_INFINITY);
    arktest.assertTrue(-1.1 > Number.NEGATIVE_INFINITY);
    arktest.assertTrue(Number.POSITIVE_INFINITY > Number.NEGATIVE_INFINITY);
    arktest.assertTrue(Number.MAX_VALUE > Number.NEGATIVE_INFINITY);
    arktest.assertTrue(Number.MIN_VALUE > Number.NEGATIVE_INFINITY);
}
