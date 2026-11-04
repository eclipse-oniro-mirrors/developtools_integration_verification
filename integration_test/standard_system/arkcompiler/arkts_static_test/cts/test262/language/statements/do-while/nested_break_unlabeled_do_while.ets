/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: nested_break_unlabeled_do_while
// description: An unlabeled break exits only the inner do-while

function main(): void {
    let outerBefore: boolean = false;
    let innerBefore: boolean = false;
    let innerAfter: boolean = false;
    let outerAfter: boolean = false;
    do {
        outerBefore = true;
        do {
            innerBefore = true;
            break;
            innerAfter = true;
        } while (false);
        outerAfter = true;
    } while (false);
    arktest.assertTrue(outerBefore);
    arktest.assertTrue(innerBefore);
    arktest.assertFalse(innerAfter);
    arktest.assertTrue(outerAfter);
}
