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
 * @id TYP_03_11_007_PASS_VOID_GENERIC_FUNCTION
 * @expect compile-pass
 * @section 3.11
 * @design void 和 undefined 可作为泛型函数实参
 * @note 正向用例：foo<void>(undefined)
 */
function genericFoo<T>(p: T): T { return p }

function testVoidGenericFunction(): void {
  let v: void = genericFoo<void>(undefined)
  let u: undefined = genericFoo<undefined>(undefined)
}