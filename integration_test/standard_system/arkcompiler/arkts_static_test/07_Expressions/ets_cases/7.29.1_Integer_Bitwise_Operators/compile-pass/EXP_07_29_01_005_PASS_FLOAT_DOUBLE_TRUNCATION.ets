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
 * @id EXP_07_29_01_005_PASS_FLOAT_DOUBLE_TRUNCATION
 * @expect compile-pass
 * @section 7.29.1
 * @design float/double 类型在位运算中先截断为适当整数类型的编译通过验证
 * @note 正向用例：验证 float/double 类型在 &, ^, | 运算中截断为整数后通过
 */
function main(): void {
    // float 字面量使用 f 后缀
    let f1: float = 3.14f;
    let f2: float = 1.59f;

    // float & float → 截断为 int
    let floatAnd: int = f1 & f2;
    let floatXor: int = f1 ^ f2;
    let floatOr: int = f1 | f2;

    let d1: double = 3.14;
    let d2: double = 1.59;

    // double & double → 截断为 long（double 的适当整数类型为 long）
    let doubleAnd: long = d1 & d2;
    let doubleXor: long = d1 ^ d2;
    let doubleOr: long = d1 | d2;

    // float & int → float 截断后与 int 运算
    let floatIntAnd: int = f1 & 5;

    let d100: long = 100;

    // double & long → double 截断后加宽为 long
    let doubleLongOr: long = d1 & d100;

    console.log('float double truncation: ' + floatAnd);
}
