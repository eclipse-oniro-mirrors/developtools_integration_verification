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
 * @id TYP_03_18_01_004_RUNTIME_FUNCTION_TYPE_BEHAVIOR
 * @expect runtime
 * @section 3.18.1
 * @design Type Function 的 unsafeCall 和 name 属性运行时验证
 * @note 运行时用例：验证 Function 类型的 unsafeCall 调用和 name 属性
 */
function addNumbers(a: int, b: int): int {
  return a + b
}

function main(): void {
  // 函数赋给 Function 类型
  let f: Function = addNumbers

  // name 属性验证
  if (f.name != "addNumbers") {
    throw new Error("f.name should be 'addNumbers', got: " + f.name)
  }

  // unsafeCall 调用
  let result: int = f.unsafeCall(3, 4) as int
  if (result != 7) {
    throw new Error("f.unsafeCall(3, 4) should be 7, got: " + result)
  }

  // lambda 赋给变量
  let x: Function = (n: int): int => { return n * 2 }
  if (x.name != "x") {
    throw new Error("x.name should be 'x', got: " + x.name)
  }

  let lambdaResult: int = x.unsafeCall(5) as int
  if (lambdaResult != 10) {
    throw new Error("x.unsafeCall(5) should be 10, got: " + lambdaResult)
  }

  console.log("Type Function behavior verified")
}