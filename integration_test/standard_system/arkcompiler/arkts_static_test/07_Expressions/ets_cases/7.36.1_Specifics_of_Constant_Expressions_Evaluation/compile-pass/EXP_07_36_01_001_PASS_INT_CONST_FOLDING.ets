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
 * @id EXP_07_36_01_001_PASS_INT_CONST_FOLDING
 * @expect compile-pass
 * @section 7.36.1
 * @design 验证整型常量表达式在编译时用 bigint 内部类型进行常量折叠
 * @note 正向用例：纯整型常量表达式编译通过，编译器内部用 bigint 类型求值
 */

// 基本算术运算常量折叠
const c1: int = 10 + 20
const c2: int = 100 * 5
const c3: int = 1000 / 10
const c4: int = 100 % 30

// 复合常量表达式
const c5: int = (10 + 20) * 2

// 移位常量表达式
const c6: int = 1 << 4
const c7: int = 64 >> 3
const c8: int = 256 >>> 2

// 位运算常量
const c9: int = 0xFF & 0x0F
const c10: int = 0xF0 | 0x0F
const c11: int = 0xFF ^ 0xF0

// 一元运算
const c12: int = -42
const c13: int = +7
const c14: int = ~0xFF

// 引用其他 const 变量
const base: int = 5
const c15: int = base * 3 + 2

// 关系比较与逻辑运算
const flag1: boolean = 3 > 1
const flag2: boolean = 10 <= 20
const flag3: boolean = 7 == 7
const flag4: boolean = 8 != 3

// 三元条件常量表达式
const c16: int = 3 > 1 ? 10 : 20
const c17: string = 5 == 5 ? 'yes' : 'no'
