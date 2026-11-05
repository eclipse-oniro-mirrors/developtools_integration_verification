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
 * @id EXP_07_17_01_012_RUNTIME_NUMERIC_CAST
 * @expect runtime
 * @section 7.17.1
 * @design 验证数值字面量 as byte 运行时值正确
 * @note 运行时用例：数值字面量 as 目标类型后的值验证
 */
function main(): void {
  let x = 42 as byte
  let y = 127 as byte
  if (x != 42) {
    throw new Error('assertion failed: expected 42, got ' + x)
  }
  if (y != 127) {
    throw new Error('assertion failed: expected 127, got ' + y)
  }
console.log('verified')
}
