/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: for_body_before_update_expression
// description: A for-loop body is evaluated before its update expression

function main(): void {
    let i: int = 0;
    for (i = 0; i < 10; i++) {
        i *= 2;
        break;
    }
    arktest.assertEQ(i, 0);

    let j: int = 0;
    for (j = 0; j < 10; j++) {
        j *= 2;
        if (j == 3) {
            throw new Error('unexpected value');
        }
    }
    arktest.assertEQ(j, 15);
}
