/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.4_A5
// description: strict equality for primitive string values

function main(): void {
    arktest.assertTrue('' === '');
    arktest.assertTrue(' ' === ' ');
    arktest.assertTrue('string' === 'string');
    arktest.assertFalse(' string' === 'string ');
    arktest.assertFalse('1.0' === '1');
}
