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
 * @id TYP_03_06_02_012_FAIL_SHIFT_FLOAT_OPERAND
 * @expect compile-fail
 * @section 3.6.2
 * @design 移位运算操作数必须是整数
 * @note 反向用例：浮点数不能做移位操作数
 */
function testShiftFloatFail(): void {
  let f: float = 3.14f
  let d: double = 3.14

  let r1: int = f << 2
  let r2: int = d >> 1
  let r3: int = 16 << f
  let r4: int = 16 >>> d
}