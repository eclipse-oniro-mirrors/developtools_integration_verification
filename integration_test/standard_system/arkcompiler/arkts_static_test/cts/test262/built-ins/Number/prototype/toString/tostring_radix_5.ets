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

// arktsid: tostring_radix_5
// description: Number.prototype.toString(5) returns the base-5 string for 0, -1, 1, NaN and Infinity

function main(): void {
    arktest.assertEQ((0).toString(5), '0', 'new Number().toString(5)');
    arktest.assertEQ((0).toString(5), '0', 'new Number(0).toString(5)');
    arktest.assertEQ((-1).toString(5), '-1', 'new Number(-1).toString(5)');
    arktest.assertEQ((1).toString(5), '1', 'new Number(1).toString(5)');
    arktest.assertEQ(NaN.toString(5), 'NaN', 'new Number(NaN).toString(5)');
    arktest.assertEQ(Infinity.toString(5), 'Infinity', 'new Number(+Infinity).toString(5)');
    arktest.assertEQ((-Infinity).toString(5), '-Infinity', 'new Number(-Infinity).toString(5)');
}