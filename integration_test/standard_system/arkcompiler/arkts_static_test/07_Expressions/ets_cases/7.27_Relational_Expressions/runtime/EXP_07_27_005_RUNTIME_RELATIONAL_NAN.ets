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
 * @id EXP_07_27_005_RUNTIME_RELATIONAL_NAN
 * @expect runtime
 * @section 7.27
 * @design NaN 关系比较永远返回 false

 *  * @note 运行时用例：验证该场景的运行时行为
 */
function main(): void {
  let nan: double = 0.0 / 0.0
  let c1: boolean = nan < 0.0
  let c2: boolean = nan > 0.0
  let c3: boolean = nan <= 0.0
  let c4: boolean = nan >= 0.0
  if (c1 || c2 || c3 || c4) {
    throw new Error('assertion failed: NaN comparisons should all be false')
  }
console.log('verified')
}
