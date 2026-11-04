/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.4_A4.2
// description: Positive and negative zero are strictly equal

function main(): void {
    arktest.assertEQ((0.0 as double) === (-0.0 as double), true);
    arktest.assertEQ((-0.0 as double) === (0.0 as double), true);
}
