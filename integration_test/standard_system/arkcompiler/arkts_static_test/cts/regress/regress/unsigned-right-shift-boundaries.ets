/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

/*---
tags: [compile-only, negative]
expected_out_1: "Syntax error ESY0194: Parameter declaration should have an explicit type annotation."
---*/

function unsignedShiftRight(val, shift) {
  return val >>> shift;
}

arktest.assertEQ(        15, unsignedShiftRight(15, 0), '15 >>> 0');
arktest.assertEQ(         7, unsignedShiftRight(15, 1), '15 >>> 1');
arktest.assertEQ(         3, unsignedShiftRight(15, 2), '15 >>> 2');

arktest.assertEQ(4294967288, unsignedShiftRight(-8, 0), '-8 >>> 0');
arktest.assertEQ(2147483644, unsignedShiftRight(-8, 1), '-8 >>> 1');
arktest.assertEQ(1073741822, unsignedShiftRight(-8, 2), '-8 >>> 2');

arktest.assertEQ(         1, unsignedShiftRight(-8, 31), '-8 >>> 31');
arktest.assertEQ(4294967288, unsignedShiftRight(-8, 32), '-8 >>> 32');
arktest.assertEQ(2147483644, unsignedShiftRight(-8, 33), '-8 >>> 33');
arktest.assertEQ(1073741822, unsignedShiftRight(-8, 34), '-8 >>> 34');

arktest.assertEQ(2147483648, unsignedShiftRight(0x80000000, 0), '0x80000000 >>> 0');
arktest.assertEQ(1073741824, unsignedShiftRight(0x80000000, 1), '0x80000000 >>> 1');
arktest.assertEQ( 536870912, unsignedShiftRight(0x80000000, 2), '0x80000000 >>> 2');

arktest.assertEQ(1073741824, unsignedShiftRight(0x40000000, 0), '0x40000000 >>> 0');
arktest.assertEQ( 536870912, unsignedShiftRight(0x40000000, 1), '0x40000000 >>> 1');
arktest.assertEQ( 268435456, unsignedShiftRight(0x40000000, 2), '0x40000000 >>> 2');
