/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: while_body_exception_propagates
// description: An exception from a while body propagates after body effects

function main(): void {
    let x: int = 0;
    try {
        while (x != 1) {
            x = 1;
            throw new Error('body');
        }
    } catch (error) {
        arktest.assertTrue(error instanceof Error);
    }
    arktest.assertEQ(x, 1);
}
