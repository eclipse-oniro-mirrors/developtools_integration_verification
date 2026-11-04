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
 * @id TYP_03_07_006_PASS_NEVER_NULL_VOID_REF
 * @expect compile-pass
 * @section 3.7
 * @design never / null / void/undefined 是引用类型
 * @note 正向用例：特殊引用类型
 */
function throwIt7(): never {
  throw new Error("never returns")
}

function testSpecialRef(): void {
  let n: int | null = null
  let u: undefined = undefined
  let v: void = undefined
}