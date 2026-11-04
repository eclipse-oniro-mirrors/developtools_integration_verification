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
 * @id EXP_07_27_8_PASS_DOUBLE_FLOAT_CMP
 * @expect compile-pass
 * @section 7.27
 * @design double 与 float 比较
 *  * @note 正向用例：验证该特性编译通过的正确用法
 */

function testDoubleFloatCmp(): void {
  let a: double = 3.14; let b: float = 2.71f; let r1: boolean = a > b; let r2: boolean = a >= b
  console.log(r1.toString(), r2.toString())
}
