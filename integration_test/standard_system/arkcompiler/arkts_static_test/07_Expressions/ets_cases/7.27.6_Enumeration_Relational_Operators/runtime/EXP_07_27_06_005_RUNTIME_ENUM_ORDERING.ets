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
 * @id EXP_07_27_06_005_RUNTIME_ENUM_ORDERING
 * @expect runtime
 * @section 7.27.6
 * @design 枚举值排序验证

 * @note 运行时用例：实际执行验证枚举排序
 */
enum Level { LOW = 1, MEDIUM = 5, HIGH = 10 }
function main(): void {
  let a: Level = Level.LOW
  let b: Level = Level.MEDIUM
  let c: Level = Level.HIGH
  if (!(a < b)) {
    throw new Error('assertion failed: LOW < MEDIUM')
  }
  if (!(b < c)) {
    throw new Error('assertion failed: MEDIUM < HIGH')
  }
  if (a > c) {
    throw new Error('assertion failed: LOW should not be > HIGH')
  }
console.log('verified')
}
