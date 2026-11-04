/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: finite_values_are_less_than_positive_infinity
// description: Finite values are less than positive infinity

function main(): void {
    arktest.assertTrue(0 < Number.POSITIVE_INFINITY);
    arktest.assertTrue(1.1 < Number.POSITIVE_INFINITY);
    arktest.assertTrue(-1.1 < Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.NEGATIVE_INFINITY < Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.MAX_VALUE < Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.MIN_VALUE < Number.POSITIVE_INFINITY);
}
