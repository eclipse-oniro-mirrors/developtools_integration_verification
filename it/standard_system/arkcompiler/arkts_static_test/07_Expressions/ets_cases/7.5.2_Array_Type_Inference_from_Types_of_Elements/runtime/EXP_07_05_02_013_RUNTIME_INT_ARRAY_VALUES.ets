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
 * @id EXP_07_05_02_013_RUNTIME_INT_ARRAY_VALUES
 * @expect runtime
 * @section 7.5.2
 * @design int[] 字面量运行时值验证
 * @note 运行时用例：验证同类型 int 数组字面量值正确
 */
function main(): void {
  let c = [1, 2, 3]
  if (c[0] != 1 || c[1] != 2 || c[2] != 3) {
    throw new Error('assertion failed: int array values')
  }
console.log('verified')
}
