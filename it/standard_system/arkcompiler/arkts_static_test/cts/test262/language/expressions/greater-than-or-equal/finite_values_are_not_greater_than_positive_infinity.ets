/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: finite_values_are_not_greater_than_positive_infinity
// description: Finite values are not greater than or equal to positive infinity

function main(): void {
    arktest.assertFalse(0 >= Number.POSITIVE_INFINITY);
    arktest.assertFalse(1.1 >= Number.POSITIVE_INFINITY);
    arktest.assertFalse(-1.1 >= Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.NEGATIVE_INFINITY >= Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.MAX_VALUE >= Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.MIN_VALUE >= Number.POSITIVE_INFINITY);
}
