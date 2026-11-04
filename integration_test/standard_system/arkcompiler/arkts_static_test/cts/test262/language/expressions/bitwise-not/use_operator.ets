/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: S9.5_A3.2_T2
// description: bitwise not conversion semantics

function main(): void {
    arktest.assertEQ(~1.2345, ~1);
    arktest.assertEQ(~(-5.4321), ~(-5));
}
