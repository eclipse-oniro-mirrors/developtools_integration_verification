/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.4_A8_T4
// description: strict equality: x or y is null or undefined, return false

function main(): void {
    arktest.assertEQ(undefined === null, false);
    arktest.assertEQ(null === undefined, false);
    arktest.assertEQ(null === 0, false);
    arktest.assertEQ(0 === null, false);
    arktest.assertEQ(null === false, false);
    arktest.assertEQ(false === null, false);
    arktest.assertEQ(undefined === false, false);
    arktest.assertEQ(false === undefined, false);
    arktest.assertEQ(null === 'null', false);
    arktest.assertEQ('null' === null, false);
    arktest.assertEQ(undefined === 'undefined', false);
    arktest.assertEQ('undefined' === undefined, false);
}
