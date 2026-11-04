/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.2_A6.2_T2
// description: abstract inequality: y is null or undefined, x is not

function main(): void {
    arktest.assertTrue(false != undefined);
    let nan: double = Number.NaN;
    arktest.assertTrue(nan != undefined);
    arktest.assertTrue('undefined' != undefined);
    arktest.assertTrue(false != null);
    arktest.assertTrue(0 != null);
    arktest.assertTrue('null' != null);
}
