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
 * @id LEX_02_01_023_RUNTIME_UNICODE_IDENTIFIER_VALUE
 * @expect runtime
 * @section 2.1
 * @design Unicode标识符运行时值操作与正确性验证 * @note 运行时用例：实际执行验证语义正确性

 */
function main(): void {
  let 变量名: number = 100
  变量名 = 变量名 + 50
  if (变量名 !== 150) { throw new Error("Unicode identifier value mismatch") }
}
