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
 * @id LEX_02_06_037_RT_ZWJ_IDENTIFIER
 * @expect runtime
 * @section 2.6
 * @design 运行时验证 ZWJ/ZWNJ 标识符正确性
 * @note 运行时用例：a+ZWJ+b 与 a+ZWNJ+b 是不同变量
 */
function main(): void {
  let a‍b: int = 100
  let a‌b: int = 200
  // 两个是不同的变量
  if (a‍b !== 100) { throw new Error("zwj var !== 100") }
  if (a‌b !== 200) { throw new Error("zwnj var !== 200") }
}
