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
// arktsid: number_numeric_literal_tostring_radix_16
// description: Calling toString(radix) (16)
// Conversion notes: Representative for the numeric-literal-tostring-radix-{2.0.36}
//   parameterized redundancy — every radix exercises the same algorithm and differs
//   only in the radix value. radix-2.0.15/17.0.36 are covered by this representative;
//   radix 1 and 37 (out-of-range boundaries) are covered by their own files.

function main(): void {
    arktest.assertEQ(0.0.toString(16), '0', '');
    arktest.assertEQ(1.0.toString(16), '1', '');
    arktest.assertEQ(NaN.toString(16), 'NaN', '');
    arktest.assertEQ(Infinity.toString(16), 'Infinity', '');
    arktest.assertEQ((15).toString(16), 'f', '15 in radix 16');
    arktest.assertEQ((255).toString(16), 'ff', '255 in radix 16');
    arktest.assertEQ((256).toString(16), '100', '256 in radix 16');
}