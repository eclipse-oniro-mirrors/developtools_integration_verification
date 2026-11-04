/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: try_throw_finally_return
// description: The finally block runs after an earlier async throw and its value is returned

async function resolving(message: string): Promise<string> {
    return message;
}

async function f(): Promise<string> {
    let result: string = '';
    try {
        throw new Error('early-throw');
    } catch (e) {
    } finally {
        result = await resolving('override');
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
