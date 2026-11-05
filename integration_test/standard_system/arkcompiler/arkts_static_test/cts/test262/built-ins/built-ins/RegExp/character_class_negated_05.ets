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
// arktsid: character_class_negated_05
// description: Execute /a[^1-9]c/.exec("abc") and check results
// Conversion notes:
//  - negated character class [^1-9] matches any char except digits 1-9; "b" matches, full match "abc" at index 0

function main(): void {
    let executed = new RegExp('a[^1-9]c').exec('abc');
    arktest.assertEQ(executed!.length, 1);
    arktest.assertEQ(executed!.index, 0);
    arktest.assertEQ(executed!.input, 'abc');
    arktest.assertEQ(executed![0], 'abc');
}