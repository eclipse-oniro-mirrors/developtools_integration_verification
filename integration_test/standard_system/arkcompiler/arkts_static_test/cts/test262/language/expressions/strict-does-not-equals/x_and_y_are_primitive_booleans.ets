/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.5_A3
// description: strict inequality for primitive boolean values

function main(): void {
    arktest.assertFalse(true !== true);
    arktest.assertFalse(false !== false);
    arktest.assertTrue(true !== false);
    arktest.assertTrue(false !== true);
}
