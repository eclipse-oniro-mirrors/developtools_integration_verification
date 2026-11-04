/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S11.9.5_A4.2
// description: Positive and negative zero are not strictly different

function main(): void {
    arktest.assertEQ((0.0 as double) !== (-0.0 as double), false);
    arktest.assertEQ((-0.0 as double) !== (0.0 as double), false);
}
