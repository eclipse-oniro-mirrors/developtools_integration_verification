/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: try_throw_finally_reject
// description: A rejection in finally overrides an earlier async throw

async function rejecting(message: string): Promise<void> {
    throw new Error(message);
}

async function f(): Promise<void> {
    try {
        throw new Error('early-throw');
    } finally {
        await rejecting('override');
    }
}

function main(): void {
    f().then((_: void): void => {
        arktest.assertTrue(false);
    }, (error: Error): void => {
        arktest.assertEQ(error.message, 'override');
    });
}
