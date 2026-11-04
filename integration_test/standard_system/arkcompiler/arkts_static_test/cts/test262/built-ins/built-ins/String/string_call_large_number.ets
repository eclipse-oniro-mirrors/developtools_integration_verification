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
// arktsid: string_call_large_number
// description: String called as a function on very large numbers produces exponential notation
// Conversion notes: test262 writes the numbers as decimal literals
//   (1000000000000000000000 / 10000000000000000000000). ArkTS rejects those
//   literals (ESY0249 Invalid number), so the equivalent scientific-notation
//   double literals 1e21 / 1e22 are used.

function main(): void {
    let s: string = String(1e21);
    arktest.assertEQ(s, '1e+21', 'String(1000000000000000000000) is \'1e+21\'');

    s = String(1e22);
    arktest.assertEQ(s, '1e+22', 'String(10000000000000000000000) is \'1e+22\'');
}