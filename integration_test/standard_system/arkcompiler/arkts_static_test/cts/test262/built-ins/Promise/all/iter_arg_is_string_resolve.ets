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

// arktsid: iter_arg_is_string_resolve
// description: Promise.all resolves when argument is a string
// Conversion notes:
//  - String implements Iterable<String>; Promise.all("") resolves to an empty array.

async function testAllStringArg(): Promise<void> {
    let v: String[] = await Promise.all('');
    arktest.assertEQ(v.length, 0, 'Promise.all(\'\') resolves with an empty array');
}

function main(): int {
    const suite = new arktest.ArkTestsuite('Promise.all string argument');
    suite.addAsyncTest("Promise.all('') resolves with empty array", testAllStringArg);
    return suite.run();
}