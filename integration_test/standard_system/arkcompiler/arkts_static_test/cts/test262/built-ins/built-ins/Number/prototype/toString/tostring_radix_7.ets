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

// arktsid: number_tostring_radix_7
// description: Calling toString(7) on a Number returns the radix-7 string representation
// Conversion notes: Number wrapper boxing is unnecessary in ArkTS; numeric literals
//   are class types and call toString(radix) directly.

function main(): void {
    arktest.assertEQ((0).toString(7), '0', '');
    arktest.assertEQ((-1).toString(7), '-1', '');
    arktest.assertEQ((1).toString(7), '1', '');
    arktest.assertEQ(NaN.toString(7), 'NaN', '');
    arktest.assertEQ(Infinity.toString(7), 'Infinity', '');
    arktest.assertEQ((-Infinity).toString(7), '-Infinity', '');
}