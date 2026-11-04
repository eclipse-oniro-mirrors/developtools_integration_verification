/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: do_while_condition_error_after_body
// description: A do-while body executes before an error in the condition

function failing(): boolean {
    throw new Error('condition');
}

function main(): void {
    let reached: int = 0;
    try {
        do {
            reached = 1;
        } while (failing());
    } catch (error) {
        arktest.assertTrue(error instanceof Error);
    }
    arktest.assertEQ(reached, 1);
}
