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
 * @id EXP2_17_01_002_PASS_CHAR_ASSIGN_TO_OBJECT
 * @expect compile-pass
 * @section 17.1
 * @design char 是 Object 的子类型：char 变量可以赋值给 Object 类型变量
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function testCharAssignToObject(): void {
  let c: char = c'A'
  let o: Object = c
  let o2: Object = c'B'
  console.log(o)
  console.log(o2)
}
