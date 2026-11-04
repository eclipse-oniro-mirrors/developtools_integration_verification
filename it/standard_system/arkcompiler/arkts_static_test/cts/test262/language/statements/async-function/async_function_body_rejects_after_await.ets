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

// arktsid: async_function_body_rejects_after_await
// description: An error thrown after await rejects an async function Promise

async function foo(): Promise<void> {
    await Promise.resolve();
    throw new Error('error');
}

function main(): void {
    foo().then((_: void): void => {
        arktest.assertTrue(false, 'success handler should not run');
    }, (e: Error): void => {
        arktest.assertTrue(e instanceof Error, 'rejected with an Error');
    });
}
