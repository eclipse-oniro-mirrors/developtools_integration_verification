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
 * @id CON_06_05_018_RUNTIME_INF_TO_INT
 * @expect runtime
 * @section 6.5
 * @design +Infinity.toInt() 应为 int 最大值
 * @note spec: if operand is +Inf, result is max int
 */
function main(): void {
  let inf: double = 1.0 / 0.0
  let maxInt: int = inf.toInt()
  if (maxInt != 2147483647) {
    throw new Error('+Inf.toInt() should be max int')
  console.log('+Inf to int verified')
}