/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: chainable-if-parenthesis-covered-logical-and
// description: coalesce expression precedence with logical AND

function main(): void {
    let x: int | null = 0;
    x = (null ?? 41) && 42;
    arktest.assertEQ(x, 42);
    x = null ?? (41 && 42);
    arktest.assertEQ(x, 42);
    x = (41 && 42) ?? null;
    arktest.assertEQ(x, 42);
    x = 41 && (null ?? 42);
    arktest.assertEQ(x, 42);
}
