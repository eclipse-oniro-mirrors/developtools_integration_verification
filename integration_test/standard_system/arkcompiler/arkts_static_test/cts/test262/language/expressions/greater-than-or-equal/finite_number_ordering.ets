/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: finite_number_ordering
// description: Ordering of finite non-zero and boundary number values

function main(): void {
    arktest.assertFalse(1 >= 1.1);
    arktest.assertTrue(1.1 >= 1);
    arktest.assertTrue(-1 >= -1.1);
    arktest.assertFalse(-1.1 >= -1);
    arktest.assertTrue(0.1 >= 0);
    arktest.assertTrue(0 >= -0.1);
    arktest.assertTrue(Number.MAX_VALUE >= Number.MAX_VALUE / 2);
    arktest.assertTrue(Number.MIN_VALUE * 2 >= Number.MIN_VALUE);
}
