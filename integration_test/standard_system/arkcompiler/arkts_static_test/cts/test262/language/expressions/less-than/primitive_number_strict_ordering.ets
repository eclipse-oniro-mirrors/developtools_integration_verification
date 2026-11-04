/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: primitive_number_strict_ordering
// description: A number is not less than itself

function main(): void {
    arktest.assertFalse(1 < 1);
    arktest.assertFalse(1.1 < 1.1);
    arktest.assertFalse(-1.1 < -1.1);
    arktest.assertFalse(Number.NEGATIVE_INFINITY < Number.NEGATIVE_INFINITY);
    arktest.assertFalse(Number.POSITIVE_INFINITY < Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.MAX_VALUE < Number.MAX_VALUE);
    arktest.assertFalse(Number.MIN_VALUE < Number.MIN_VALUE);
}
