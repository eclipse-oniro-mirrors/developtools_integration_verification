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
 * @id TYP_03_20_021_RUNTIME_DERIVED_NULLISH
 * @expect runtime
 * @section 3.20
 * @design Base|null 可持有 Derived 实例或 null
 * @note 运行时用例：派生类 nullish
 */
class Base21 { id(): string { return "base" } }
class Derived21 extends Base21 { id(): string { return "derived" } }

function main(): void {
  let v: Base21 | null = new Derived21()
  if (v?.id() != "derived") throw new Error("derived id failed")

  v = null
  let r: string | undefined = v?.id()
  if (r !== undefined) throw new Error("null safe call should return undefined")

  console.log("derived nullish verified")
}