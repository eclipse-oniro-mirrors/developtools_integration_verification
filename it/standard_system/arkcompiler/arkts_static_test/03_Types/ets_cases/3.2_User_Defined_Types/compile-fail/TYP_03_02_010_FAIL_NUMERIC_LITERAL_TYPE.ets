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
 * @id TYP_03_02_010_FAIL_NUMERIC_LITERAL_TYPE
 * @expect compile-fail
 * @section 3.2
 * @design ArkTS 不支持数字/布尔字面量类型（与 TypeScript 不同）
 * @note 反向用例：spec §3.15.1 仅声明 String Literal Types
 *       此用例同时记录 ArkTS 与 TS 的设计差异
 */
function testNumericLiteralFail(): void {
  // ArkTS 不支持数字字面量类型（TS 中合法）
  let n1: 42 = 42
  let n2: 0 = 0

  // 不支持布尔字面量类型
  let t: true = true
  let f: false = false
}