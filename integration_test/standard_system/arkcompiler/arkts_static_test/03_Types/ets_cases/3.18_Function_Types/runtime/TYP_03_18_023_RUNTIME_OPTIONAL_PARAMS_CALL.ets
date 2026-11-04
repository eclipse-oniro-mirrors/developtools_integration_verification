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
 * @id TYP_03_18_023_RUNTIME_OPTIONAL_PARAMS_CALL
 * @expect runtime
 * @section 3.18
 * @design 函数类型可选参数的运行时调用验证
 * @note 运行时用例：验证可选参数传 undefined 和不传参数的行为
 */
type OptionalFunc = (x?: int, y?: string) => string

function main(): void {
  let f: OptionalFunc = (x?: int, y?: string): string => {
    let result: string = "default"
    if (x != undefined) {
      result = result + "_" + "" + x
    }
    if (y != undefined) {
      result = result + "_" + y
    }
    return result
  }

  let r1: string = f()
  if (r1 != "default") {
    throw new Error("f() should return 'default', got: " + r1)
  }

  let r2: string = f(42)
  if (r2 != "default_42") {
    throw new Error("f(42) should return 'default_42', got: " + r2)
  }

  let r3: string = f(42, "hello")
  if (r3 != "default_42_hello") {
    throw new Error("f(42, 'hello') should return 'default_42_hello', got: " + r3)
  }

  let r4: string = f(undefined, undefined)
  if (r4 != "default") {
    throw new Error("f(undefined, undefined) should return 'default', got: " + r4)
  }

  console.log("Optional params call verified")
}