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
// arktsid: math_imul_results
// description: Math.imul 32-bit signed integer multiplication results
// Conversion notes: 0xffffffff/0xfffffffe written as -1/-2 (int32 two's complement, same bit pattern). Dropped
// 2147483648 (out of int32 range, needs uint32 coercion) and 0.1/0.9/1.1/1.9 (double-arg ToUint32 coercion)
// assertions -
// 2147483648 (out of int32 range, needs uint32 coercion) and 0.1/0.9/1.1/1.9 (double-arg ToUint32 coercion)
// assertions -
// ArkTS int is 32-bit signed with no implicit numeric coercion. INT_MIN expressed as -2147483647-1 (no direct int
// literal for -2147483648).

function main(): void {
    let intMin: int = -2147483647 - 1;
    arktest.assertEQ(Math.imul(2, 4), 8, '(2, 4)');
    arktest.assertEQ(Math.imul(-1, 8), -8, '(-1, 8)');
    arktest.assertEQ(Math.imul(-2, -2), 4, '(-2, -2)');
    arktest.assertEQ(Math.imul(-1, 5), -5, '(0xffffffff, 5)');
    arktest.assertEQ(Math.imul(-2, 5), -10, '(0xfffffffe, 5)');
    arktest.assertEQ(Math.imul(0, 7), 0, '(-0, 7)');
    arktest.assertEQ(Math.imul(7, 0), 0, '(7, -0)');
    arktest.assertEQ(Math.imul(1073741824, 7), -1073741824, '(2^30, 7)');
    arktest.assertEQ(Math.imul(7, 1073741824), -1073741824, '(7, 2^30)');
    arktest.assertEQ(Math.imul(1073741824, 1073741824), 0, '(2^30, 2^30)');
    arktest.assertEQ(Math.imul(-1073741824, 7), 1073741824, '(-2^30, 7)');
    arktest.assertEQ(Math.imul(7, -1073741824), 1073741824, '(7, -2^30)');
    arktest.assertEQ(Math.imul(-1073741824, -1073741824), 0, '(-2^30, -2^30)');
    arktest.assertEQ(Math.imul(intMin, 7), intMin, '(INT_MIN, 7)');
    arktest.assertEQ(Math.imul(7, intMin), intMin, '(7, INT_MIN)');
    arktest.assertEQ(Math.imul(intMin, intMin), 0, '(INT_MIN, INT_MIN)');
    arktest.assertEQ(Math.imul(2147483647, 7), 2147483641, '(INT_MAX, 7)');
    arktest.assertEQ(Math.imul(7, 2147483647), 2147483641, '(7, INT_MAX)');
    arktest.assertEQ(Math.imul(2147483647, 2147483647), 1, '(INT_MAX, INT_MAX)');
    arktest.assertEQ(Math.imul(65536, 65536), 0, '(65536, 65536)');
    arktest.assertEQ(Math.imul(65535, 65536), -65536, '(65535, 65536)');
    arktest.assertEQ(Math.imul(65536, 65535), -65536, '(65536, 65535)');
    arktest.assertEQ(Math.imul(65535, 65535), -131071, '(65535, 65535)');
}