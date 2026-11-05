/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: finite_values_are_not_less_than_negative_infinity
// description: Finite values are not less than negative infinity

function main(): void {
    arktest.assertFalse(0 < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(1.1 < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(-1.1 < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(Number.POSITIVE_INFINITY < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(Number.MAX_VALUE < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(Number.MIN_VALUE < Number.NEGATIVE_INFINITY);
}
