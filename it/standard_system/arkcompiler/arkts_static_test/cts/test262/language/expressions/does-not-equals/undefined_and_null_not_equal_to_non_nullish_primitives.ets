/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.2_A6.2_T1
// description: abstract inequality: x is null or undefined, y is not

function main(): void {
    arktest.assertTrue(undefined != true);
    arktest.assertTrue(undefined != 0);
    arktest.assertTrue(undefined != 'undefined');
    arktest.assertTrue(null != false);
    arktest.assertTrue(null != 0);
    arktest.assertTrue(null != 'null');
}
