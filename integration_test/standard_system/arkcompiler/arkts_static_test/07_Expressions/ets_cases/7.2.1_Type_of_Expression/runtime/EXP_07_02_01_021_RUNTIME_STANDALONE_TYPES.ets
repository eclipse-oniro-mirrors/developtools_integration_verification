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
 * @id EXP_07_02_01_021_RUNTIME_STANDALONE_TYPES
 * @expect runtime
 * @section 7.2.1
 * @design standalone 表达式在运行时类型正确
 * @note 运行时用例：验证 standalone 推断类型的运行时行为
 */
function main(): void {
  let a = 42
  if (a != 42) {
    throw new Error('assertion failed: a != 42')
  }
  let b = 'hello'
  if (b != 'hello') {
    throw new Error('assertion failed: b != hello')
  }
  let c = true
  if (c != true) {
    throw new Error('assertion failed: c != true')
  }
console.log('verified')
}
