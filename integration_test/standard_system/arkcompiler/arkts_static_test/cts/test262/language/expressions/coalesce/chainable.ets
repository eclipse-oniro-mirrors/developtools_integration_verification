/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: chainable
// description: coalesce expression evaluation and precedence

function main(): void {
    let x: int | boolean | null | undefined = undefined;
    x = null ?? undefined ?? 42;
    arktest.assertEQ(x, 42);
    x = undefined ?? null ?? 42;
    arktest.assertEQ(x, 42);
    x = null ?? null ?? 42;
    arktest.assertEQ(x, 42);
    x = undefined ?? undefined ?? 42;
    arktest.assertEQ(x, 42);
}
