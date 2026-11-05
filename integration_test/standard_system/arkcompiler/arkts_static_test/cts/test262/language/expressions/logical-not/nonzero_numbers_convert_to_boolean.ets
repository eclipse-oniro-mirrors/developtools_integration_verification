/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S9.2_A4_T4
// description: Nonzero numbers convert to Boolean by implicit transformation

function main(): void {
    arktest.assertEQ(!Double.POSITIVE_INFINITY, false);
    arktest.assertEQ(!Double.NEGATIVE_INFINITY, false);
    arktest.assertEQ(!Double.MAX_VALUE, false);
    arktest.assertEQ(!Double.MIN_VALUE, false);
    arktest.assertEQ(!13, false);
    arktest.assertEQ(!(-13), false);
    arktest.assertEQ(!1.3, false);
    arktest.assertEQ(!(-1.3), false);
}
