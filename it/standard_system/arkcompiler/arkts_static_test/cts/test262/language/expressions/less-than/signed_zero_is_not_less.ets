/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: signed_zero_is_not_less
// description: Neither positive nor negative zero is less than the other

function main(): void {
    arktest.assertFalse(0 < 0);
    arktest.assertFalse(-0 < -0);
    arktest.assertFalse(0 < -0);
    arktest.assertFalse(-0 < 0);
}
