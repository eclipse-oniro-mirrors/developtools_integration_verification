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
 * @id TYP_03_06_02_013_FAIL_BITWISE_FLOAT_OPERAND
 * @expect compile-fail
 * @section 3.6.2
 * @design 按位运算 & ^ | ~ 必须是整数
 * @note 反向用例：浮点数不能做按位运算
 */
function testBitwiseFloatFail(): void {
  let f: float = 3.14f
  let d: double = 2.71

  let r1: int = f & 0xFF
  let r2: int = d | 1
  let r3: int = f ^ 2
  let r4: int = ~d
}