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
 * @id EXP_07_29_01_002_PASS_LONG_BITWISE
 * @expect compile-pass
 * @section 7.29.1
 * @design long 类型位运算
 * @note 正向用例：验证该特性编译通过的正确用法。
 */
function testLongBitwise(): void {
  let a: long = 0xFFFFFFFF; let b: long = 0x0000FFFF
  let andVal: long = a & b; let orVal: long = a | b
  console.log(andVal.toString(), orVal.toString())
}
