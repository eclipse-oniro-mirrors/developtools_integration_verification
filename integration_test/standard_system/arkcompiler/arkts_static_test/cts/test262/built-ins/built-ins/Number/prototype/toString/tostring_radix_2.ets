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

// arktsid: number_tostring_radix_2
// description: toString with radix 2 returns the binary string representation (0, -1, 1, NaN, +-Infinity)

function main(): void {
    arktest.assertEQ(0.0.toString(2), '0', 'Number.prototype.toString(2) must return "0"');
    arktest.assertEQ(0.0.toString(2), '0', '(new Number()).toString(2) must return "0"');
    arktest.assertEQ(0.0.toString(2), '0', '(new Number(0)).toString(2) must return "0"');
    arktest.assertEQ((-1).toString(2), '-1', '(new Number(-1)).toString(2) must return "-1"');
    arktest.assertEQ((1).toString(2), '1', '(new Number(1)).toString(2) must return "1"');
    arktest.assertEQ(NaN.toString(2), 'NaN', '(new Number(NaN)).toString(2) must return "NaN"');
    arktest.assertEQ(Infinity.toString(2), 'Infinity', '(new Number(Infinity)).toString(2) must return "Infinity"');
        arktest.assertEQ(Number.NEGATIVE_INFINITY.toString(2), '-Infinity',
        '(new Number(-Infinity)).toString(2) must return "-Infinity"');
}