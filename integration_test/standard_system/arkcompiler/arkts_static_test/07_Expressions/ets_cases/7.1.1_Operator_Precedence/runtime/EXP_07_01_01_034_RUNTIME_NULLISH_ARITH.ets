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
 * @id EXP_07_01_01_034_RUNTIME_NULLISH_ARITH
 * @expect runtime
 * @section 7.1.1
 * @design null 合并 `??` 优先级低于加法：`null ?? 1 + 2` = 3
 * @note 运行时用例：验证 null 合并与加法优先级
 */
function main(): void {
  let x: int | undefined = undefined
  let r1: int = x ?? 1 + 2
  // x ?? (1+2) = undefined ?? 3 = 3
  if (r1 != 3) {
    throw new Error('assertion failed: undefined??1+2 != 3, got ' + r1)
  }
  let y: int | undefined = 10
  let r2: int = y ?? 1 + 2
  if (r2 != 10) {
    throw new Error('assertion failed: 10??1+2 != 10, got ' + r2)
  }
console.log('verified')
}
