/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: break_in_while_loop
// description: Break exits a while loop after the first iteration

function main(): void {
    let reached: boolean = false;
    while (true) {
        reached = true;
        break;
    }
    arktest.assertTrue(reached);
}
