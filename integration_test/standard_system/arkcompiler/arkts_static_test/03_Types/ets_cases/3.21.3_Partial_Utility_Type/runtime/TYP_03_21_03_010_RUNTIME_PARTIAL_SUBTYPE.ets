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
 * @id TYP_03_21_03_010_RUNTIME_PARTIAL_SUBTYPE
 * @expect runtime
 * @section 3.21.3
 * @design U <: T ⇒ Partial<U> <: Partial<T>，运行时正确赋值
 * @note 运行时用例：子类型协变
 */
interface SuperI { name: string }
interface SubI extends SuperI { extra: int }

function main(): void {
  let pSub: Partial<SubI> = {name: "sub", extra: 1}
  let pSuper: Partial<SuperI> = pSub
  if (pSuper.name != "sub") {
    throw new Error("Partial subtype covariant failed")
  }
  console.log("Partial subtype runtime verified")
}