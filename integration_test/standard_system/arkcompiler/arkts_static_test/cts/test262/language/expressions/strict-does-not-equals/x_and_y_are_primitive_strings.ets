/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.5_A5
// description: strict inequality for primitive string values

function main(): void {
    arktest.assertFalse('' !== '');
    arktest.assertFalse(' ' !== ' ');
    arktest.assertFalse('string' !== 'string');
    arktest.assertTrue(' string' !== 'string ');
    arktest.assertTrue('1.0' !== '1');
}
