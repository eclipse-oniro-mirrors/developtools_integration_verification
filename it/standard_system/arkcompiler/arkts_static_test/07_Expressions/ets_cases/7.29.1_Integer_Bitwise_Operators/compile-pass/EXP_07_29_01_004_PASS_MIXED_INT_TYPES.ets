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
 * @id EXP_07_29_01_004_PASS_MIXED_INT_TYPES
 * @expect compile-pass
 * @section 7.29.1
 * @design 不同整数类型混合位运算（小类型加宽为大类型）的编译通过验证
 * @note 正向用例：验证 int+long、byte+long、short+int 等混合类型运算通过加宽转换编译通过
 */
function main(): void {
    let i1: int = 60;
    let l1: long = 13000;

    // int & long → int 加宽为 long
    let intLongAnd: long = i1 & l1;
    let intLongXor: long = i1 ^ l1;
    let intLongOr: long = i1 | l1;

    let b1: byte = 15;

    // byte & long → byte 提升为 int 再加宽为 long
    let byteLongAnd: long = b1 & l1;
    let byteLongXor: long = b1 ^ l1;
    let byteLongOr: long = b1 | l1;

    let s1: short = 60;

    // short & int → short 提升为 int
    let shortIntAnd: int = s1 & i1;
    let shortIntXor: int = s1 ^ i1;
    let shortIntOr: int = s1 | i1;

    console.log('mixed int types: ' + intLongAnd);
}
