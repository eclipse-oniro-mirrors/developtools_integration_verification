/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: primitive_number_non_increasing
// description: A number is greater than or equal to itself

function main(): void {
    arktest.assertTrue(1 >= 1);
    arktest.assertTrue(1.1 >= 1.1);
    arktest.assertTrue(-1.1 >= -1.1);
    arktest.assertTrue(Number.NEGATIVE_INFINITY >= Number.NEGATIVE_INFINITY);
    arktest.assertTrue(Number.POSITIVE_INFINITY >= Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.MAX_VALUE >= Number.MAX_VALUE);
    arktest.assertTrue(Number.MIN_VALUE >= Number.MIN_VALUE);
}
