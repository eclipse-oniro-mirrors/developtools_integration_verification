/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: short-circuit-prevents-evaluation
// description: nullish coalescing prevents evaluation of the right side

function poison(): int {
    throw new Error('should not evaluate poison');
}

function main(): void {
    let x: int | undefined = undefined;
    x = undefined ?? 42 ?? undefined ?? poison();
    arktest.assertEQ(x, 42);
    x = 42 ?? undefined ?? poison();
    arktest.assertEQ(x, 42);
    x = undefined ?? 42 ?? poison();
    arktest.assertEQ(x, 42);
    x = 42 ?? poison();
    arktest.assertEQ(x, 42);
}
