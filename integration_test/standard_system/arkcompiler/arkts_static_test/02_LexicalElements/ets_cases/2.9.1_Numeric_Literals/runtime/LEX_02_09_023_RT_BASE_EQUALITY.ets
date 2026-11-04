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
 * @id LEX_02_09_023_RT_BASE_EQUALITY
 * @expect runtime
 * @section 2.9.1
 * @design 各进制值相等验证
 * @note runtime 用例：验证不同进制的相同值相等
 */

function main(): void {
  let dec: int = 42
  let hex: int = 0x2A
  let oct: int = 0o52
  let bin: int = 0b101010

  if (dec !== hex) { throw new Error("dec != hex") }
  if (dec !== oct) { throw new Error("dec != oct") }
  if (dec !== bin) { throw new Error("dec != bin") }
}
