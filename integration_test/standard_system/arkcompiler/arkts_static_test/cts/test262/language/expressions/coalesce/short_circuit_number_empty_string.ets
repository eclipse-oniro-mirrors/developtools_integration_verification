/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: short-circuit-number-empty-string
// description: coalesce short-circuit preserves a non-nullish primitive


function main(): void {
    let empty: string = '';
    let x: int | string | boolean | null | undefined = undefined;
    x = empty ?? 1;
    arktest.assertEQ(x, '');
    x = empty ?? null;
    arktest.assertEQ(x, '');
    x = empty ?? undefined;
    arktest.assertEQ(x, '');
    x = empty ?? null ?? undefined;
    arktest.assertEQ(x, '');
    x = empty ?? undefined ?? null;
    arktest.assertEQ(x, '');
    x = empty ?? null ?? null;
    arktest.assertEQ(x, '');
    x = empty ?? undefined ?? undefined;
    arktest.assertEQ(x, '');
    x = null ?? empty ?? null;
    arktest.assertEQ(x, '');
    x = null ?? empty ?? undefined;
    arktest.assertEQ(x, '');
    x = undefined ?? empty ?? null;
    arktest.assertEQ(x, '');
    x = undefined ?? empty ?? undefined;
    arktest.assertEQ(x, '');
}
