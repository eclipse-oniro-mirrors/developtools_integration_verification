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
 * @id CON_06_05_017_RUNTIME_NAN_TO_INT
 * @expect runtime
 * @section 6.5
 * @design NaN.toInt() 应为 0
 * @note spec: if operand is NaN, result is 0
 */
function main(): void {
  let nan: double = 0.0 / 0.0
  if (nan.toInt() != 0) {
    throw new Error('NaN.toInt() should be 0')
  }
  console.log('NaN to int verified')
}