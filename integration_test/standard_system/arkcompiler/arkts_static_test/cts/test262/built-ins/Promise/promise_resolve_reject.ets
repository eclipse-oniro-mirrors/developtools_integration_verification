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

// arktsid: promise_resolve_reject
// description: Promise.resolve and Promise.reject create settled promises
// Migrated from test262: built-ins/Promise resolve/reject tests

function main(): int {
    // Promise.resolve creates a fulfilled promise
    let p1 = Promise.resolve<int>(42);
    p1.then((value: int): void => {
        arktest.assertEQ(value, 42);
    });

    // Promise.reject creates a rejected promise
    let p2 = Promise.reject<string>(new Error('test error'));
    p2.catch((error: Error): void => {
        arktest.assertEQ(error.message, 'test error');
    });

    return 0;
}