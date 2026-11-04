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
 * @id LEX_02_05_045_RT_NULLISH_COALESCING
 * @expect runtime
 * @section 2.5
 * @design 空值合并运算符运行时验证
 * @note runtime 用例：验证空值合并运算符的运行时行为
 */

function main(): void {
  // 空值合并运算符
  let x: int | null = null
  let y: int = x ?? 42
  if (y !== 42) { throw new Error("null ?? 42 failed, got " + y) }

  let a: int | null = 10
  let b: int = a ?? 42
  if (b !== 10) { throw new Error("10 ?? 42 failed, got " + b) }

  let c: string | undefined = undefined
  let d: string = c ?? "default"
  if (d !== "default") { throw new Error("undefined ?? default failed, got " + d) }

  let e: string | undefined = "hello"
  let f: string = e ?? "default"
  if (f !== "hello") { throw new Error("hello ?? default failed, got " + f) }
}
