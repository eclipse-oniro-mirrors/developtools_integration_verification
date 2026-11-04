/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.4_A3
// description: strict equality for primitive boolean values

function main(): void {
    arktest.assertTrue(true === true);
    arktest.assertTrue(false === false);
    arktest.assertFalse(true === false);
    arktest.assertFalse(false === true);
}
