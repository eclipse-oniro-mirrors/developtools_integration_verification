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
 * @id EXP_07_01_01_031_RUNTIME_ASSIGN_RIGHT_ASSOC
 * @expect runtime
 * @section 7.1.1
 * @design 赋值右结合：`a = b = c = 5` 从右向左赋值，a,b,c 全部为 5
 * @note 运行时用例：验证赋值右结合性
 */
function main(): void {
  let a: int = 0
  let b: int = 0
  let c: int = 0
  a = b = c = 5
  if (a != 5) {
    throw new Error('assertion failed: a != 5, got ' + a)
  }
  if (b != 5) {
    throw new Error('assertion failed: b != 5, got ' + b)
  }
  if (c != 5) {
    throw new Error('assertion failed: c != 5, got ' + c)
  }
console.log('verified')
}
