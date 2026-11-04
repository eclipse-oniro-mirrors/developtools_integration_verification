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
 * @id TYP_03_12_003_PASS_NULL_UNION_STRING
 * @expect compile-pass
 * @section 3.12
 * @design string | null 联合类型声明与赋值
 * @note 正向用例：验证 null 在联合类型中与引用类型的组合
 */
function testNullUnionString(): void {
  let s: string | null = null
  s = "hello"
  s = null
}