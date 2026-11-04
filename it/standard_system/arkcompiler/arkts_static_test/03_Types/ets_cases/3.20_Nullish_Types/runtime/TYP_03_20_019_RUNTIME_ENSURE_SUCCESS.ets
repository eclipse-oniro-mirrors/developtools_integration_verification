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
 * @id TYP_03_20_019_RUNTIME_ENSURE_SUCCESS
 * @expect runtime
 * @section 3.20
 * @design ensure-not-nullish 在非 nullish 时返回非 nullish 值
 * @note 运行时用例：expr!
 */
function main(): void {
  let s: string | undefined = "hello"
  let v: string = s!
  if (v != "hello") throw new Error("ensure string failed")

  let n: int | null = 42
  let i: int = n!
  if (i != 42) throw new Error("ensure int failed")

  console.log("ensure not nullish success verified")
}