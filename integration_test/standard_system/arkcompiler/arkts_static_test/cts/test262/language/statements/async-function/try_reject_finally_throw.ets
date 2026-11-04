/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: try_reject_finally_throw
// description: An error thrown in finally overrides an earlier async rejection

async function rejecting(message: string): Promise<void> {
    throw new Error(message);
}

function throwOverride(): void {
    throw new Error('override');
}

async function f(): Promise<void> {
    try {
        await rejecting('early-reject');
    } finally {
        throwOverride();
    }
}

function main(): void {
    f().then((_: void): void => {
        arktest.assertTrue(false);
    }, (error: Error): void => {
        arktest.assertEQ(error.message, 'override');
    });
}
