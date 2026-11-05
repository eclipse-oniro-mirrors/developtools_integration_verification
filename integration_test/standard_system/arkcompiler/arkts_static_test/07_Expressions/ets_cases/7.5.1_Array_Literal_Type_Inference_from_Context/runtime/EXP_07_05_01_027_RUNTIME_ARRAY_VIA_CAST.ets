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
 * @id EXP_07_05_01_027_RUNTIME_ARRAY_VIA_CAST
 * @expect runtime
 * @section 7.5.1
 * @design Cast 上下文数组字面量运行时值验证
 * @note 运行时用例：验证 cast 目标类型推断的数组字面量值正确
 */
function main(): void {
  let a = [10, 20, 30] as int[]
  if (a[0] != 10 || a[1] != 20 || a[2] != 30) {
    throw new Error('assertion failed: cast array values')
  }
console.log('verified')
}
