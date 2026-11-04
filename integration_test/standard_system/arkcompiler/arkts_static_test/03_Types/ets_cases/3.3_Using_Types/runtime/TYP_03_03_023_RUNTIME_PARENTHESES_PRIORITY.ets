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
 * @id TYP_03_03_023_RUNTIME_PARENTHESES_PRIORITY
 * @expect runtime
 * @section 3.3
 * @design 验证 spec §3.3 括号优先级 4 种类型在运行时行为
 * @note 运行时用例：实际执行验证 4 种括号优先级语义
 */
function main(): void {
  // 1. string[] | undefined - 整个数组可空
  let a: string[] | undefined = undefined
  if (a !== undefined) {
    throw new Error("a should be undefined")
  }
  a = ["x", "y"]
  if (a.length != 2) {
    throw new Error("a length wrong")
  }

  // 2. (string | undefined)[] - 元素可空
  let b: (string | undefined)[] = ["aa", undefined]
  if (b.length != 2) {
    throw new Error("b length wrong")
  }
  if (b[1] !== undefined) {
    throw new Error("b[1] should be undefined")
  }

  // 3. () => string | undefined - 返回值可空
  let c: () => string | undefined = (): string | undefined => { return undefined }
  let r: string | undefined = c()
  if (r !== undefined) {
    throw new Error("c() should return undefined")
  }

  // 4. (() => string) | undefined - 整个函数可空
  let d: (() => string) | undefined = undefined
  if (d !== undefined) {
    throw new Error("d should be undefined")
  }
  d = (): string => { return "hi" }
  if (d() != "hi") {
    throw new Error("d() should be 'hi'")
  }

  console.log("Parentheses priority verified")
}