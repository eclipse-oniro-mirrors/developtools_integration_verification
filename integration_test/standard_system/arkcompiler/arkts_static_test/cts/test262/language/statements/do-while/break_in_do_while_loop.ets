/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */

// arktsid: break_in_do_while_loop
// description: Break exits a do-while loop before its condition is evaluated

function main(): void {
    let reached: boolean = false;
    do {
        reached = true;
        break;
    } while (false);
    arktest.assertTrue(reached);
}
