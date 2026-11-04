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
 * @id LEX_02_08_002_PASS_RELATIONAL_OPS
 * @expect compile-pass
 * @section 2.8
 * @design 关系运算符 < > <= >= 应用于数值类型
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testRelationalOps(): void {
  let a: number = 5
  let b: number = 10
  let r1: boolean = a < b
  let r2: boolean = a > b
  let r3: boolean = a <= b
  let r4: boolean = a >= b
}
