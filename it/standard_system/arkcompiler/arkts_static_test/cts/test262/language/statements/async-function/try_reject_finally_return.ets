/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: try_reject_finally_return
// description: The finally block runs after an earlier async rejection and its value is returned

async function rejecting(message: string): Promise<void> {
    throw new Error(message);
}

async function f(): Promise<string> {
    let result: string = '';
    try {
        await rejecting('early-reject');
    } catch (e) {
    } finally {
        result = 'override';
    }
    return result;
}

function main(): void {
    f().then((value: string): void => {
        arktest.assertEQ(value, 'override');
    }, (_: Error): void => {
        arktest.assertTrue(false);
    });
}
