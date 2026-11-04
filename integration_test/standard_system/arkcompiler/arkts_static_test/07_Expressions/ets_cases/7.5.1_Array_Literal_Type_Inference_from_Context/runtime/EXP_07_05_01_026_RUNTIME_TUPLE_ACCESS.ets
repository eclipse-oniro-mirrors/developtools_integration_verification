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
 * @id EXP_07_05_01_026_RUNTIME_TUPLE_ACCESS
 * @expect runtime
 * @section 7.5.1
 * @design Tuple 字面量运行时值验证
 * @note 运行时用例：验证 tuple 类型上下文字面量元素访问正确
 */
function main(): void {
  let t: [int, string] = [42, 'hello']
  if (t[0] != 42) {
    throw new Error('assertion failed: tuple[0] = ' + t[0])
  }
  if (t[1] != 'hello') {
    throw new Error('assertion failed: tuple[1] = ' + t[1])
  }
console.log('verified')
}
