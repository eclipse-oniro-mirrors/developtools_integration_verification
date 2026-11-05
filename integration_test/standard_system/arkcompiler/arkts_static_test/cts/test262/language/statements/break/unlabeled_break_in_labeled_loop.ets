/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: unlabeled_break_in_labeled_loop
// description: An unlabeled break exits the current labeled do-while loop

function main(): void {
    let x: int = 0;
    let y: int = 0;
    loop: do {
        x = 2;
        break;
        y = 2;
    } while (false);
    arktest.assertEQ(x, 2);
    arktest.assertEQ(y, 0);
}
