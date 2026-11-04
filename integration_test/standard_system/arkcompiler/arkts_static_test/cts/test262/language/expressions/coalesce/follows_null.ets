/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: follows-null
// description: coalesce expression evaluation and precedence

function main(): void {
    let x: int | boolean | null | undefined = undefined;
    x = null ?? 42;
    arktest.assertEQ(x, 42);
    x = null ?? undefined;
    arktest.assertEQ(x, undefined);
    x = null ?? null;
    arktest.assertEQ(x, null);
    x = null ?? false;
    arktest.assertEQ(x, false);
}
