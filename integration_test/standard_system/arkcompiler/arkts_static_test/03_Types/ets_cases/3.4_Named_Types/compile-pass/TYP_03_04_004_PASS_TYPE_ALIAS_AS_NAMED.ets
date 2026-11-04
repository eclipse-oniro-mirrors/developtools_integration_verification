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
 * @id TYP_03_04_004_PASS_TYPE_ALIAS_AS_NAMED
 * @expect compile-pass
 * @section 3.4
 * @design type alias 声明引入命名类型，可给匿名类型（array/union/function/tuple）命名
 * @note 正向用例：type alias 把匿名类型转化为命名类型
 */
type NamedArray = int[]
type NamedUnion = int | string
type NamedFunction = (x: int) => int
type NamedTuple = [int, string, boolean]

function testTypeAliasNamed(): void {
  let a: NamedArray = [1, 2, 3]
  let u: NamedUnion = 42
  u = "hello"
  let f: NamedFunction = (x: int): int => { return x + 1 }
  let t: NamedTuple = [1, "x", true]
}