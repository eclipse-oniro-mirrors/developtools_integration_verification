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
// arktsid: string_call_infinity
// description: String called as a function on +/-Infinity returns "Infinity"/"-Infinity"
// Conversion notes: test262 also exercises String(1/0) and String(-1/0). ArkTS
//   rejects the 1/0 integer-division-by-zero literal (ESY0273), so only the
//   Infinity constants are covered.

function main(): void {
    let s: string = String(Infinity);
    arktest.assertEQ(s, 'Infinity', 'String(Infinity) is \'Infinity\'');

    s = String(-Infinity);
    arktest.assertEQ(s, '-Infinity', 'String(-Infinity) is \'-Infinity\'');

    s = String(Number.POSITIVE_INFINITY);
    arktest.assertEQ(s, 'Infinity', 'String(Number.POSITIVE_INFINITY) is \'Infinity\'');

    s = String(Number.NEGATIVE_INFINITY);
    arktest.assertEQ(s, '-Infinity', 'String(Number.NEGATIVE_INFINITY) is \'-Infinity\'');
}