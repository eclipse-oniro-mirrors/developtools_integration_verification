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
 * @id LEX_02_08_029_RUNTIME_OPTIONAL_NULLISH
 * @expect runtime
 * @section 2.8
 * @design 可选链 ?. 在 null 时短路、空值合并 ?? 仅替换 null/undefined
 * @note 运行时用例：实际执行验证语义正确性
 */
class Addr {
  city: string = "Beijing"
}
class Holder {
  addr: Addr | null = null
}
function main(): void {
  let h1: Holder = new Holder()
  let c1: string | undefined = h1.addr?.city
  if (c1 !== undefined) { throw new Error("optional chain on null should yield undefined") }

  let h2: Holder = new Holder()
  h2.addr = new Addr()
  let c2: string | undefined = h2.addr?.city
  if (c2 !== "Beijing") { throw new Error("optional chain on non-null failed") }

  let s: string | null = null
  let v1: string = s ?? "default"
  if (v1 !== "default") { throw new Error("?? on null failed") }

  let s2: string | null = ""
  let v2: string = s2 ?? "default"
  if (v2 !== "") { throw new Error("?? should not replace empty string") }
}
