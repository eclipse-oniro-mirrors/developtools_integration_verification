/*
* Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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
/**
 * @id STMT_08_02_004_PASS_compound_assignment
 * @expect compile-pass
 * @section 8.2
 * @design 测试复合赋值表达式作为语句，包括算术和位运算复合赋值
 * @note 复合赋值表达式作为语句应编译通过，结果被丢弃
 */
function testArithmeticCompound(): void {
    let x: int = 10;
    x += 5;
    x -= 3;
    x *= 2;
    x /= 4;
    x %= 3;
}

function testBitwiseCompound(): void {
    let x: int = 0xFF;
    x &= 0x0F;
    x |= 0xF0;
    x ^= 0xAA;
    x <<= 2;
    x >>= 1;
}

function testStringConcatenation(): void {
    let s: string = "hello";
    s += " world";
}
