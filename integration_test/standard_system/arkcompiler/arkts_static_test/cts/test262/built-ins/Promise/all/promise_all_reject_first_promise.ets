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

// arktsid: promise_all_reject_first_promise
// description: Promise.all() rejects when a promise in its array rejects
// Conversion notes: ArkTS Promise rejects with Error (not arbitrary value); the first member rejection is propagated.

function main(): void {
    let rejectP1: (e: Error) => void = (_e: Error): void => {};
    let p1 = new Promise<int>((_resolve: (v: int) => void, reject: (e: Error) => void): void => {
        rejectP1 = reject;
    });
    let p2 = Promise.resolve<int>(2);
    let allP = Promise.all<int>([p1, p2]);

    rejectP1(new Error('rejected'));

    waitForCompletion(async (): Promise<void> => {
        let rejected: boolean = false;
        let message: string = '';
        try {
            await allP;
        } catch (e) {
            rejected = true;
            message = e.message;
        }
        arktest.assertTrue(rejected, 'Promise.all rejects when a member rejects');
        arktest.assertEQ(message, 'rejected', 'first rejection reason is propagated');
    });
}