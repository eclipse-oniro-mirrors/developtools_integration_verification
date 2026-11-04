/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: signed_zero_non_increasing
// description: Positive and negative zero are mutually greater than or equal

function main(): void {
    arktest.assertTrue(0 >= 0);
    arktest.assertTrue(-0 >= -0);
    arktest.assertTrue(0 >= -0);
    arktest.assertTrue(-0 >= 0);
}
