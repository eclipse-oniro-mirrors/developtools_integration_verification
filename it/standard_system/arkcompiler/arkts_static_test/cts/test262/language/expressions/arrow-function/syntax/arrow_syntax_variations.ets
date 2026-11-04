/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: arrow_syntax_variations
// description: Valid arrow functions support concise and block bodies with varying parameter lists

function main(): void {
    arktest.assertEQ(((): int => 1)(), 1);
    arktest.assertEQ(((a: int): int => a + 1)(1), 2);
    arktest.assertEQ(((): int => { return 3; })(), 3);
    arktest.assertEQ(((a: int): int => { return a + 3; })(1), 4);
    arktest.assertEQ(((a: int, b: int): int => a + b)(1, 4), 5);
    arktest.assertEQ(((a: int, b: int): int => { return a + b; })(1, 5), 6);
}
