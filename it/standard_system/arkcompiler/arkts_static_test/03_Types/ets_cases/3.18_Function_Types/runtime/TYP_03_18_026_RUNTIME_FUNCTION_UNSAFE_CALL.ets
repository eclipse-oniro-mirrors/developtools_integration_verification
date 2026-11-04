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
 * @id TYP_03_18_026_RUNTIME_FUNCTION_UNSAFE_CALL
 * @expect runtime
 * @section 3.18
 * @design Type Function 的 unsafeCall 方法验证
 * @note 运行时用例：验证 Function.unsafeCall 调用
 */
function add(a: number, b: number): number {
  return a + b
}

function greet(name: string): string {
  return "Hello, " + name
}

function main(): void {
  let f1: Function = add
  let r1: number = f1.unsafeCall(3.0, 4.0) as number
  if (r1 != 7.0) {
    throw new Error("f1.unsafeCall(3.0, 4.0) should be 7.0, got: " + r1)
  }

  let f2: Function = greet
  let r2: string = f2.unsafeCall("World") as string
  if (r2 != "Hello, World") {
    throw new Error("f2.unsafeCall('World') should be 'Hello, World', got: " + r2)
  }

  console.log("Function unsafeCall verified")
}