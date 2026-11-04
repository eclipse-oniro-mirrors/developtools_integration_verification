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
 * @id EXP_07_05_02_014_RUNTIME_NUMERIC_ARRAY_VALUES
 * @expect runtime
 * @section 7.5.2
 * @design number[] 混合数值类型运行时值验证
 * @note 运行时用例：验证混合数值类型数组字面量值正确
 */
function main(): void {
  let d = [1.0, 2.0, 3.0]
  if (d[0] != 1.0 || d[1] != 2.0 || d[2] != 3.0) {
    throw new Error('assertion failed: numeric array values')
  }
console.log('verified')
}
