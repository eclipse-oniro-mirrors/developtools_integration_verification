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
 * @id CON_06_05_019_RUNTIME_NEGINF_TO_INT
 * @expect runtime
 * @section 6.5
 * @design -Infinity.toInt() 应为 int 最小值
 * @note spec: if operand is -Inf, result is min int
 */
function main(): void {
  let negInf: double = -1.0 / 0.0
  let minInt: int = negInf.toInt()
  if (minInt != -2147483648) {
    throw new Error('-Inf.toInt() should be min int')
  console.log('-Inf to int verified')
}