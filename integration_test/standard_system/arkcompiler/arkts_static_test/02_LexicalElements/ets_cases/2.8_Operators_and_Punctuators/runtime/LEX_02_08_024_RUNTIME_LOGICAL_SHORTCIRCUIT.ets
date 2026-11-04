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
 * @id LEX_02_08_024_RUNTIME_LOGICAL_SHORTCIRCUIT
 * @expect runtime
 * @section 2.8
 * @design 逻辑运算符 && || 短路求值与 ! 取反
 * @note 运行时用例：实际执行验证语义正确性
 */
let sideEffect: number = 0
function bumpAndReturn(v: boolean): boolean {
  sideEffect = sideEffect + 1
  return v
}
function main(): void {
  sideEffect = 0
  let r1: boolean = false && bumpAndReturn(true)
  if (sideEffect !== 0) { throw new Error("&& did not short-circuit") }
  if (r1) { throw new Error("&& result wrong") }

  sideEffect = 0
  let r2: boolean = true || bumpAndReturn(false)
  if (sideEffect !== 0) { throw new Error("|| did not short-circuit") }
  if (!r2) { throw new Error("|| result wrong") }

  if (!(!false)) { throw new Error("! op failed") }
}
