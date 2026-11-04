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
 * @id TYP_03_18_01_005_RUNTIME_UNSAFE_CALL_ERROR
 * @expect runtime
 * @section 3.18.1
 * @design unsafeCall 参数数量不匹配时抛出 runtime error
 * @runtime-throws=Error
 * @note 运行时用例：验证 unsafeCall 参数数量不匹配时的 runtime error
 *       spec 3.18.1 明确指出 "f.unsafeCall() // Runtime error, wrong number of arguments"
 */
function greet(name: string): string {
  return "Hello, " + name
}

function main(): void {
  let f: Function = greet

  // 正确调用
  let result: string = f.unsafeCall("World") as string
  if (result != "Hello, World") {
    throw new Error("Expected 'Hello, World', got: " + result)
  }

  // 参数数量不匹配 → runtime error（异常向外抛出触发 @runtime-throws）
  f.unsafeCall()
}