/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: unlabeled_inner_while_break
// description: An unlabeled break exits only the innermost while loop

function main(): void {
    let outerBefore: boolean = false;
    let innerBefore: boolean = false;
    let innerAfter: boolean = false;
    let outerAfter: boolean = false;

    outer: while (true) {
        outerBefore = true;
        while (true) {
            innerBefore = true;
            break;
            innerAfter = true;
        }
        outerAfter = true;
        break outer;
    }

    arktest.assertTrue(outerBefore);
    arktest.assertTrue(innerBefore);
    arktest.assertTrue(!innerAfter);
    arktest.assertTrue(outerAfter);
}
