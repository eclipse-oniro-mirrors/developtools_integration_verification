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
// arktsid: math_fround_value_conversion
// description: Math.fround binary32 rounding for power-of-two boundaries and decimals

function main(): void {
    arktest.assertEQ(Math.fround(4294967295), 4294967296, '2**32-1');
    arktest.assertEQ(Math.fround(4294967296), 4294967296, '2**32');
    arktest.assertEQ(Math.fround(4294967297), 4294967296, '2**32+1');
    arktest.assertEQ(Math.fround(0.1), 0.10000000149011612, '0.1');
    arktest.assertEQ(Math.fround(0.2), 0.20000000298023224, '0.2');
    arktest.assertEQ(Math.fround(0.5), 0.5, '0.5');
}