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
 * @id TYP_03_01_008_PASS_NEVER_EXHAUSTIVE
 * @expect compile-pass
 * @section 3.1
 * @design never 作为 throw 函数返回值类型，穷举检查中的 never 返回路径，never 在联合类型中的使用(union 消除)
 * @note 正向用例：验证该特性编译通过的正确用法
 */
function throwError(): never {
  throw new Error("always throws")
}

function exhaustiveCheck(x: string): string {
  if (x == "a") {
    return "A"
  } else if (x == "b") {
    return "B"
  }
  return throwError()
}

function neverInUnion(): void {
  let u: int | never = 1
}

function unreachable(): never {
  throw new Error("unreachable")
}

function callUnreachable(): void {
  unreachable()
}