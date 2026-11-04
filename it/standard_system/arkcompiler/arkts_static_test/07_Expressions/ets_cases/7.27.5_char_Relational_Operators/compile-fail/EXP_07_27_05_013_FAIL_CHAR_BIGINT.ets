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
 * @id EXP_07_27_05_013_FAIL_CHAR_BIGINT
 * @expect compile-fail
 * @section 7.27.5
 * @design 验证 char 与 bigint 关系运算产生编译时错误
 *  * @note 反向用例：验证该场景应产生编译时错误
 *       spec: 非 char 且非数值类型操作数 → compile-time error
 *       bigint 不在 numeric types (byte/short/int/long/float/double) 中
 */
function main(): void {
    let c: char = c'A';
    let bi: bigint = 1n;
    let r: boolean = c < bi;  // Compile-time error: char vs bigint
}
