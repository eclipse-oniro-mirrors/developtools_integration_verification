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
 * @id EXP_07_27_6_RUNTIME_NAN_LT
 * @expect runtime
 * @section 7.27
 * @design NaN 始终不小于任何值
 *  * @note 运行时用例：验证该场景的运行时行为
 */

function main(): void {
  let nan: double = 0.0 / 0.0
  if (nan < 0.0) {
    throw new Error('assertion failed: NaN < 0')
  }
  if (nan > 0.0) {
    throw new Error('assertion failed: NaN > 0')
  }
console.log('verified')
}
