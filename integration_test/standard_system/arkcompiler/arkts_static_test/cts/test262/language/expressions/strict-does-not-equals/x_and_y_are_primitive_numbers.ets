/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.5_A4.3
// description: strict inequality for primitive number values

function main(): void {
    arktest.assertFalse(Number.POSITIVE_INFINITY !== Number.POSITIVE_INFINITY);
    arktest.assertFalse(Number.NEGATIVE_INFINITY !== Number.NEGATIVE_INFINITY);
    arktest.assertFalse(13 !== 13);
    arktest.assertFalse(-13 !== -13);
    arktest.assertFalse(1.3 !== 1.3);
    arktest.assertFalse(-1.3 !== -1.3);
    arktest.assertFalse(Number.POSITIVE_INFINITY !== -Number.NEGATIVE_INFINITY);
    arktest.assertTrue(1 !== 0.999999999999);
    arktest.assertFalse(1.0 !== 1);
}
