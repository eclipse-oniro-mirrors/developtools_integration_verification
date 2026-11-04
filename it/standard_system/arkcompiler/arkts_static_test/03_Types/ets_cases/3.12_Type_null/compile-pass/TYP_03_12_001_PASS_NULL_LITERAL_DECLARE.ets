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
 * @id TYP_03_12_001_PASS_NULL_LITERAL_DECLARE
 * @expect compile-pass
 * @section 3.12
 * @design null 字面量声明与赋值：let x: null = null
 * @note 正向用例：验证 null 字面量作为类型标注和值
 */
function testNullLiteralDeclare(): void {
  let x: null = null
  let y: null = null
  x = null
  y = null
}