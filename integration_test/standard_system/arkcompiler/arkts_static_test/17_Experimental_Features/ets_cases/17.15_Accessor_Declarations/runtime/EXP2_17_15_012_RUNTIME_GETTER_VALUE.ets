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
 * @id EXP2_17_15_012_RUNTIME_GETTER_VALUE
 * @expect runtime
 * @section 17.15
 * @design 验证 getter 返回正确的计算值
 * @note 运行时用例：getter 应返回 backing 变量的两倍值
 */
let g_computed_base: int = 21

get computedValue(): int {
  return g_computed_base * 2
}

function main(): void {
  let result: int = computedValue
  if (result != 42) {
    throw new Error("assertion failed: expected 42, got " + result)
  }
  console.log("verified: getter returned " + result)
}
