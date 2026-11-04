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
 * @id EXP_07_33_005_RUNTIME_TERNARY_SHORTCIRCUIT
 * @expect runtime
 * @section 7.33
 * @design 三元条件仅评估一个分支（短路）

 * @note 运行时用例：实际执行验证三元短路
 */
let sideEffectCalls: int = 0
function trueBranch(): int { sideEffectCalls++; return 1 }
function falseBranch(): int { sideEffectCalls++; return 2 }
function main(): void {
  let condition: boolean = true
  let result: int = condition ? trueBranch() : falseBranch()
  if (sideEffectCalls != 1) {
    throw new Error('assertion: only one branch evaluated')
  }
  if (result != 1) {
    throw new Error('assertion: true branch should be 1')
  }
console.log('verified')
}
