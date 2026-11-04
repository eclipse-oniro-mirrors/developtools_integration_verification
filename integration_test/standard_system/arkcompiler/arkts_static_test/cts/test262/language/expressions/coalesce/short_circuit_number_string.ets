/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: short-circuit-number-string
// description: coalesce short-circuit preserves a non-nullish primitive


function main(): void {
    let text: string = 'test';
    let x: int | string | boolean | null | undefined = undefined;
    x = text ?? 1;
    arktest.assertEQ(x, 'test');
    x = text ?? null;
    arktest.assertEQ(x, 'test');
    x = text ?? undefined;
    arktest.assertEQ(x, 'test');
    x = text ?? null ?? undefined;
    arktest.assertEQ(x, 'test');
    x = text ?? undefined ?? null;
    arktest.assertEQ(x, 'test');
    x = text ?? null ?? null;
    arktest.assertEQ(x, 'test');
    x = text ?? undefined ?? undefined;
    arktest.assertEQ(x, 'test');
    x = null ?? text ?? null;
    arktest.assertEQ(x, 'test');
    x = null ?? text ?? undefined;
    arktest.assertEQ(x, 'test');
    x = undefined ?? text ?? null;
    arktest.assertEQ(x, 'test');
    x = undefined ?? text ?? undefined;
    arktest.assertEQ(x, 'test');
}
