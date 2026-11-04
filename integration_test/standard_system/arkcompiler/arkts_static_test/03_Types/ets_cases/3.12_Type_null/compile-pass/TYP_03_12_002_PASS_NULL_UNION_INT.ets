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
 * @id TYP_03_12_002_PASS_NULL_UNION_INT
 * @expect compile-pass
 * @section 3.12
 * @design int | null 联合类型声明、赋值 int 值和 null 值
 * @note 正向用例：验证 null 在联合类型中与值类型的组合
 */
function testNullUnionInt(): void {
  let x: int | null = null
  x = 42
  x = null
  let y: int | null = 100
  y = null
}