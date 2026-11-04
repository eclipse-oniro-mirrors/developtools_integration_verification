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
 * @id TYP_03_06_01_013_FAIL_LITERAL_OUT_OF_RANGE
 * @expect compile-fail
 * @section 3.6.1
 * @design 数值字面量超出类型范围应编译失败
 * @note 反向用例：边界值溢出
 */
function testLiteralOutOfRangeFail(): void {
  let b1: byte = 128         // byte max + 1
  let b2: byte = -129        // byte min - 1
  let s1: short = 32768      // short max + 1
  let s2: short = -32769     // short min - 1
  let i1: int = 2147483648   // int max + 1
}