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
 * @id TYP_03_20_022_RUNTIME_CAST_NULLISH
 * @expect runtime
 * @section 3.20
 * @design cast 从 nullish 转回 non-nullish（非 nullish 情况）
 * @note 运行时用例：as cast 成功
 */
function main(): void {
  let s: string | undefined = "hello"
  let v: string = s as string
  if (v.length != 5) throw new Error("cast string failed")

  let o: Object | null = new Object()
  let obj: Object = o as Object
  if (!(obj instanceof Object)) throw new Error("cast object failed")

  console.log("cast nullish verified")
}