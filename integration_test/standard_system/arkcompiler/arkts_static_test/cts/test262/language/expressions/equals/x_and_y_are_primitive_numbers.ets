/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.1_A4.3
// description: abstract equality for primitive number values

function main(): void {
    arktest.assertTrue(Number.POSITIVE_INFINITY == Number.POSITIVE_INFINITY);
    arktest.assertTrue(Number.NEGATIVE_INFINITY == Number.NEGATIVE_INFINITY);
    arktest.assertTrue(Number.POSITIVE_INFINITY == -Number.NEGATIVE_INFINITY);
    arktest.assertFalse(1 == 0.999999999999);
    arktest.assertTrue(1.0 == 1);
}
