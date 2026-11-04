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

// arktsid: verify_context_in_finally_block
// description: The outer binding remains visible in a finally block

function f(): void {}

function verifyFinally(x: string): void {
    try {
        let x: string = 'inner';
        throw new Error('inner');
    } catch (e) {
    } finally {
        f();
        arktest.assertEQ(x, 'outer');
    }
}

function main(): void {
    verifyFinally('outer');
}
