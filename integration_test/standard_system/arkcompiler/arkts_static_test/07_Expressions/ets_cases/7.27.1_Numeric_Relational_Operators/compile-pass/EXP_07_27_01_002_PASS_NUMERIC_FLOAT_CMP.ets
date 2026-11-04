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
 * @id EXP_07_27_01_002_PASS_NUMERIC_FLOAT_CMP
 * @expect compile-pass
 * @section 7.27.1
 * @design float/double 类型 IEEE 754 关系比较
 * @note 正向用例：验证该特性编译通过的正确用法。ArkTS 中浮点字面量使用 f 后缀表示 float。
 */
function testNumericFloatCmp(): void {
  let a: double = 3.14
  let b: double = 2.71
  let c1: boolean = a < b
  let c2: boolean = a >= b
  let c3: boolean = 1.0 <= 1.0
  let c4: boolean = -0.0 >= 0.0
  let a2: float = 3.14f
  let b2: float = 2.71f
  let d1: boolean = a2 < b2
  console.log(c1.toString(), c2.toString(), c3.toString(), c4.toString())
}
