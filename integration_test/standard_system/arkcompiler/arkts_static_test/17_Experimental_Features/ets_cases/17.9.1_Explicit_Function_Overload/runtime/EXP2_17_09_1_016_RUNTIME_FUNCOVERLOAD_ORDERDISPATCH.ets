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
 * @id EXP2_17_09_1_016_RUNTIME_FUNCOVERLOAD_ORDERDISPATCH
 * @expect runtime
 * @section 17.9.1
 * @design overload 按声明顺序匹配，第一个匹配签名的候选胜出
 * @note 运行时用例：通过副作用跟踪验证正确的函数被调用
 */
let callLog: string = ''

function handleInt(a: int): string {
  callLog += "int(" + a + ')'
  return 'int:' + a
}
function handleNum(a: double): string {
  callLog += "num(" + a + ')'
  return 'num:' + a
}
function handleStr(a: string): string {
  callLog += "str(" + a + ')'
  return 'str:' + a
}

overload handle { handleInt, handleNum, handleStr }

function main(): void {
  callLog = ''

  let r1: string = handle(42)
  if (callLog != "int(42)") {
    throw new Error("Expected handleInt, got: " + callLog)
  }

  callLog = ''
  let r2: string = handle('hello')
  if (callLog != "str(hello)") {
    throw new Error("Expected handleStr, got: " + callLog)
  }

  callLog = ''
  let r3: string = handle(3.14)
  if (callLog != "num(3.14)") {
    throw new Error("Expected handleNum, got: " + callLog)
  }

  console.log('Overload order dispatch verified')
}
