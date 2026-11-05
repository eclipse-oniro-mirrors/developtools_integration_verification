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
 * @id TYP_03_18_007_PASS_FUNCTION_TYPE_UNION
 * @expect compile-pass
 * @section 3.18
 * @design 函数类型在联合类型中使用（需括号包裹）
 * @note 正向用例：验证函数类型在联合类型中正确使用括号包裹
 */
type StringOrFunc = string | ((x: int) => int)
type NullableFunc = ((x: int) => int) | undefined
type MultiUnion = int | ((x: int) => int) | string

function testFunctionTypeUnion(): void {
  let a: StringOrFunc = "hello"
  let b: StringOrFunc = (x: int): int => { return x + 1 }
  let c: NullableFunc = (x: int): int => { return x * 2 }
  let d: NullableFunc = undefined
  let e: MultiUnion = 42
  let f: MultiUnion = (x: int): int => { return x }
  let g: MultiUnion = "world"
}