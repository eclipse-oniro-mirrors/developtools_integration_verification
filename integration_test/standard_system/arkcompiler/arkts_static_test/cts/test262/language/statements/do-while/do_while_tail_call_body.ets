/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: do_while_tail_call_body
// description: A recursive call can be the final statement in a do-while body

let callCount: int = 0;

function f(n: int): void {
    if (n == 0) {
        callCount += 1;
        return;
    }
    do {
        return f(n - 1);
    } while (false);
}

function main(): void {
    f(100);
    arktest.assertEQ(callCount, 1);
}
