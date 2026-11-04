/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.5_A8_T4
// description: strict inequality: x or y is null or undefined, return true

function main(): void {
    arktest.assertEQ(undefined !== null, true);
    arktest.assertEQ(null !== undefined, true);
    arktest.assertEQ(null !== 0, true);
    arktest.assertEQ(0 !== null, true);
    arktest.assertEQ(null !== false, true);
    arktest.assertEQ(false !== null, true);
    arktest.assertEQ(undefined !== false, true);
    arktest.assertEQ(false !== undefined, true);
    arktest.assertEQ(null !== 'null', true);
    arktest.assertEQ('null' !== null, true);
    arktest.assertEQ(undefined !== 'undefined', true);
    arktest.assertEQ('undefined' !== undefined, true);
}
