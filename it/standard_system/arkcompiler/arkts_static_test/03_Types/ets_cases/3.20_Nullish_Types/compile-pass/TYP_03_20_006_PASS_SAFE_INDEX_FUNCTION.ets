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
 * @id TYP_03_20_006_PASS_SAFE_INDEX_FUNCTION
 * @expect compile-pass
 * @section 3.20
 * @design safe indexing 和 safe function call
 * @note 正向用例：arr?.[0] / f?.()
 */
function testSafeIndexFunction(): void {
  let arr: string[] | undefined = undefined
  let first: string | undefined = arr?.[0]

  arr = ["a", "b"]
  first = arr?.[0]

  let f: (() => string) | undefined = undefined
  let r: string | undefined = f?.()

  f = (): string => { return "ok" }
  r = f?.()
}