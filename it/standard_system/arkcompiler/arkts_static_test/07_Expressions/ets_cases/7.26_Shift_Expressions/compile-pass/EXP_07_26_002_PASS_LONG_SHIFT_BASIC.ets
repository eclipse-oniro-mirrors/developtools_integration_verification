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
 * @id EXP_07_26_002_PASS_LONG_SHIFT_BASIC
 * @expect compile-pass
 * @section 7.26
 * @design long 类型三个移位运算符（<<, >>, >>>）的基本编译通过验证
 * @note 正向用例：验证 long 类型在三种移位运算中均可编译通过
 *       包括：左移、带符号右移、无符号右移
 *       ArkTS 不支持 Java 风格的 L 后缀，使用 long 变量代替
 */
function main(): void {
    let a: long = 16;
    let b: long = 2;
    let c8: long = 8;
    let c3: long = 3;
    let c2: long = 2;

    // 左移
    let left: long = a << b;
    // 带符号右移
    let signedRight: long = a >> b;
    // 无符号右移
    let unsignedRight: long = a >>> b;

    // 字面量移位
    let l1: long = c8 << c3;
    let l2: long = c8 >> c2;
    let l3: long = c8 >>> c2;

    console.log('result left: ' + left);
    console.log('result signedRight: ' + signedRight);
    console.log('result unsignedRight: ' + unsignedRight);
}
