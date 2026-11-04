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
// arktsid: repeat_string_n_times
// description: String.prototype.repeat returns a String made from n copies appended together.

function main(): void {
    let str = 'abc';
    arktest.assertEQ(str.repeat(1), str);
    arktest.assertEQ(str.repeat(3), 'abcabcabc');

    // Large repeat count
    let dots = '.';
    let count: int = 10000;
    let expected = '';
    for (let i = 0; i < count; i++) {
        expected += dots;
    }
    arktest.assertEQ('.'.repeat(count), expected);
}