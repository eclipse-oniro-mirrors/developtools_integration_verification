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
 * @id TYP_03_06_03_023_RUNTIME_FLOAT_DIV_ZERO_ZERO_NAN
 * @expect runtime
 * @section 3.6.3
 * @design 0.0/0.0 → NaN（IEEE 754 标准）
 * @note 运行时用例：0/0 数学未定义
 */
function main(): void {
  let c: double = 0.0 / 0.0
  // NaN 不等于自身
  if (c == c) {
    throw new Error("0.0/0.0 should be NaN")
  }
  console.log("0.0/0.0 = NaN verified")
}