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
 * @id LEX_02_05_033_RT_LITERAL_VALUES
 * @expect runtime
 * @section 2.5
 * @design 字面量 Token 的运行时值
 * @note 运行时用例：十六进制/八进制/二进制字面量值
 */
function main(): void {
  let hex: int = 0xFF
  let oct: int = 0o77
  let bin: int = 0b1010
  if (hex !== 255) { throw new Error("hex !== 255") }
  if (oct !== 63) { throw new Error("oct !== 63") }
  if (bin !== 10) { throw new Error("bin !== 10") }
}
