/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 */

// arktsid: abrupt-is-a-short-circuit
// description: nullish coalescing short-circuits after abrupt completion

function poison(): int {
    throw new Error('poison handled');
}

function morePoison(): int {
    throw new Error('poison');
}

function main(): void {
    let undefinedValue: int | undefined = undefined;
    let nullValue: int | null = null;
    arktest.expectError(() => {
        let result = undefinedValue ?? poison() ?? morePoison();
        arktest.assertEQ(result, 0);
    });
    arktest.expectError(() => {
        let result = nullValue ?? poison() ?? morePoison();
        arktest.assertEQ(result, 0);
    });
    arktest.expectError(() => {
        let result = poison() ?? morePoison();
        arktest.assertEQ(result, 0);
    });
}
