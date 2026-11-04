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

// arktsid: tostring_radix_6
// description: Number.prototype.toString(6) returns the base-6 string representation

function main(): void {
    arktest.assertEQ((0).toString(6), '0', 'new Number() in radix 6');
    arktest.assertEQ((0).toString(6), '0', 'new Number(0) in radix 6');
    arktest.assertEQ((-1).toString(6), '-1', '-1 in radix 6');
    arktest.assertEQ((1).toString(6), '1', '1 in radix 6');
    arktest.assertEQ(NaN.toString(6), 'NaN', 'NaN in radix 6');
    arktest.assertEQ(Infinity.toString(6), 'Infinity', 'Infinity in radix 6');
    arktest.assertEQ((-Infinity).toString(6), '-Infinity', '-Infinity in radix 6');
}