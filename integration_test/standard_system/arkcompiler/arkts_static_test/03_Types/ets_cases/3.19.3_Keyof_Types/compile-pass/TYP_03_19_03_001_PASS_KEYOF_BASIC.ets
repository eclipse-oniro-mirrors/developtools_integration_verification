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
 * @id TYP_03_19_03_001_PASS_KEYOF_BASIC
 * @expect compile-pass
 * @section 3.19.3
 * @design keyof 类型基本用法：从类成员名构建字符串字面量联合类型
 * @note 正向用例：验证 keyof A 返回 "field" | "method"
 */
class A3 {
  field: number = 0
  method(): void {}
}
type KeysOfA = keyof A3

function testKeyofBasic(): void {
  let key: KeysOfA = "field"
  key = "method"
}