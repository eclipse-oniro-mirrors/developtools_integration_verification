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
 * @id TYP_03_01_004_PASS_BOOLEAN_LOGIC
 * @expect compile-pass
 * @section 3.1
 * @design boolean 声明、Boolean 别名、逻辑运算(&& || !)、相等性(== !=)、if/while/for 控制流条件
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testBoolean(): void {
  let b: boolean = true
  let b2: Boolean = false
  let b3: boolean = b && b2
  let b4: boolean = b || b2
  let b5: boolean = !b
  let b6: boolean = b == b2
  let b7: boolean = b != b2

  if (b) {
    let x: int = 1
  }

  let result: boolean = (1 < 2) && (3 > 1)

  while (b) {
    b = false
  }

  let count: int = 0
  for (let i: int = 0; i < 10; i++) {
    count++
  }
}