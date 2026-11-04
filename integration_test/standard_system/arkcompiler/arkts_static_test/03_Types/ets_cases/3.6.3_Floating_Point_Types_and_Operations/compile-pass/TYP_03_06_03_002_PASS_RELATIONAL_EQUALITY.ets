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
 * @id TYP_03_06_03_002_PASS_RELATIONAL_EQUALITY
 * @expect compile-pass
 * @section 3.6.3
 * @design 浮点关系/相等比较结果是 boolean
 * @note 正向用例：< <= > >= == !=
 */
function testRelationalEquality(): void {
  let a: double = 3.14
  let b: double = 2.71

  let r1: boolean = a < b
  let r2: boolean = a <= b
  let r3: boolean = a > b
  let r4: boolean = a >= b
  let r5: boolean = a == b
  let r6: boolean = a != b

  // 跨类型比较
  let f: float = 1.0f
  let r7: boolean = f < a
}