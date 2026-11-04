/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: do_while_body_exception_propagates
// description: An exception from a do-while body propagates after body effects

function main(): void {
    let reached: int = 0;
    try {
        do {
            reached = 1;
            throw new Error('body');
        } while (false);
    } catch (error) {
        arktest.assertTrue(error instanceof Error);
    }
    arktest.assertEQ(reached, 1);
}
