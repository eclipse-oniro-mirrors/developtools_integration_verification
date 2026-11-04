/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.2_A5.1
// description: abstract inequality for primitive string values

function main(): void {
    arktest.assertFalse('' != '');
    arktest.assertFalse(' ' != ' ');
    arktest.assertTrue(' ' != '');
    arktest.assertFalse('string' != 'string');
    arktest.assertTrue(' string' != 'string ');
    arktest.assertTrue('1.0' != '1');
    arktest.assertTrue('0xff' != '255');
}
