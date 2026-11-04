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
 * @id TYP_03_06_03_029_RUNTIME_FLOAT32_DIV_ZERO
 * @expect runtime
 * @section 3.6.3
 * @design float (32 位) 除零 → +Infinity（与 double 行为一致）
 * @note 运行时用例：float 类型也遵循 IEEE 754
 */
function main(): void {
  let c: float = 5.0f / 0.0f
  let posInfF: float = 1.0f / 0.0f
  if (c != posInfF) {
    throw new Error("float 5.0f/0.0f should be +Infinity")
  }
  console.log("float 5.0f/0.0f = Infinity verified")
}