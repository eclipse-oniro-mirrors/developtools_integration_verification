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
 * @id TYP_03_20_007_PASS_NULLISH_COALESCING
 * @expect compile-pass
 * @section 3.20
 * @design nullish coalescing 运算 ??
 * @note 正向用例：null/undefined 使用 fallback，非 nullish 使用自身
 */
function testNullishCoalescing(): void {
  let a: string | undefined = undefined
  let r1: string = a ?? "fallback"

  let b: string | null = null
  let r2: string = b ?? "fallback"

  let c: string | null | undefined = "ok"
  let r3: string = c ?? "fallback"
}