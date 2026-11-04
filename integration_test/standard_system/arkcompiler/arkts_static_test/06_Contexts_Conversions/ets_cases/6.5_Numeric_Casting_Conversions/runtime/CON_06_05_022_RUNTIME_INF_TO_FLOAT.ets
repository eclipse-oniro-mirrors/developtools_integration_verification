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
 * @id CON_06_05_022_RUNTIME_INF_TO_FLOAT
 * @expect runtime
 * @section 6.5
 * @design double.Infinity toFloat() 为 float.Infinity
 * @note spec: Double infinity is converted to float infinity
 */
function main(): void {
  let inf: double = 1.0 / 0.0
  let f: float = inf.toFloat()
  if (f < 1e38f) {
    throw new Error('Inf->float should be Inf')
  console.log('Inf to float verified')
}