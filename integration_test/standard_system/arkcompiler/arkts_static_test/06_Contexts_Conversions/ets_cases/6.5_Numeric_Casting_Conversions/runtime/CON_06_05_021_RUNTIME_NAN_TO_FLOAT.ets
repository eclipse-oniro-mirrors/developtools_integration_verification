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
 * @id CON_06_05_021_RUNTIME_NAN_TO_FLOAT
 * @expect runtime
 * @section 6.5
 * @design double.NaN toFloat() 为 float.NaN
 * @note spec: Double NaN is converted to float NaN
 */
function main(): void {
  let nan: double = 0.0 / 0.0
  let f: float = nan.toFloat()
  if (!isNaN(f)) {
    throw new Error('NaN->float should be NaN')
  }
  console.log('NaN to float verified')
}