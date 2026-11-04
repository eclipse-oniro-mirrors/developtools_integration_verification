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
 * @id EXP_07_27_06_006_RUNTIME_ENUM_SAME_VALUE
 * @expect runtime
 * @section 7.27.6
 * @design 同值枚举关系比较

 * @note 运行时用例：实际执行验证同值枚举比较
 */
enum Dup { X = 1, Y = 1 }
function main(): void {
  let a: Dup = Dup.X
  let b: Dup = Dup.Y
  if (a < b) {
    throw new Error('assertion failed: X(1) should not be < Y(1)')
  }
  if (!(a <= b)) {
    throw new Error('assertion failed: X(1) <= Y(1)')
  }
console.log('verified')
}
