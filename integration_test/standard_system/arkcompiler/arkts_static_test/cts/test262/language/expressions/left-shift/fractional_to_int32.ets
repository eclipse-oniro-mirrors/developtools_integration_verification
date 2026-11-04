/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

// arktsid: fractional_to_int32
// description: Left shift truncates fractional numeric operands

function main(): void {
    arktest.assertEQ(1.2345 << 0, 1);
    arktest.assertEQ(-5.4321 << 0, -5);
}
