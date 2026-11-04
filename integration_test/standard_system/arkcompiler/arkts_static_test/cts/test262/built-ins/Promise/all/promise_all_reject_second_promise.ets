/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: promise_all_reject_second_promise
// description: Promise.all rejects when second promise in array rejects
// Conversion notes: ArkTS Promise rejects with Error only (JS allows any value); int 2 becomes Error("2"), asserted via
// error.message.

async function testPromiseAllRejects(): Promise<void> {
    let rejectP2: (e: Error) => void = (e: Error): void => {};
    let p1: Promise<int> = Promise.resolve(1);
    let p2: Promise<int> = new Promise<int>((resolve: (v: int) => void, reject: (e: Error) => void): void => {
        rejectP2 = reject;
    });

    let all: Promise<int[]> = Promise.all([p1, p2]);
    rejectP2(new Error('2'));

    let fulfilled: boolean = false;
    try {
        await all;
        fulfilled = true;
    } catch (e) {
        arktest.assertEQ(e.message, '2', 'rejection reason is 2');
    }
    arktest.assertFalse(fulfilled, 'Promise.all must reject, not fulfill');
}

function main(): int {
    let suite = new arktest.ArkTestsuite('Promise.all rejects when second promise rejects');
    suite.addAsyncTest('promise_all_reject_second_promise', testPromiseAllRejects);
    return suite.run();
}