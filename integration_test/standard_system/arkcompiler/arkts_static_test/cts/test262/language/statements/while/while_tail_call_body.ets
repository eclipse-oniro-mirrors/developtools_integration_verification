/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: while_tail_call_body
// description: A recursive call can be the final statement in a while body

let callCount: int = 0;

function f(n: int): void {
    if (n == 0) {
        callCount += 1;
        return;
    }
    while (true) {
        return f(n - 1);
    }
}

function main(): void {
    f(100);
    arktest.assertEQ(callCount, 1);
}
