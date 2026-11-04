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
// arktsid: quantifier_range_09
// description: QuantifierPrefix {42,93} — /b{42,93}c/ does not match "aaabbbbcccddeeeefffff"

function main(): void {
    let r: RegExp = new RegExp('b{42,93}c');
    let result: boolean = r.test('aaabbbbcccddeeeefffff');
    arktest.assertFalse(result, 'b{42,93}c should not match the input string');
}