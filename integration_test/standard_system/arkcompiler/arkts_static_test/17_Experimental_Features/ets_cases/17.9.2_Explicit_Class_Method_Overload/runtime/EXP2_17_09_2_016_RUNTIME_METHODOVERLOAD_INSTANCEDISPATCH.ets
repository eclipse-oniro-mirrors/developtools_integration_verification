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
 * @id EXP2_17_09_2_016_RUNTIME_METHODOVERLOAD_INSTANCEDISPATCH
 * @expect runtime
 * @section 17.9.2
 * @design 类实例方法 overload 运行时调度
 * @note 运行时用例：通过实例调用 overload 验证正确分发
 */
let callLog: string = ''

class Calculator {
  calc(a: int): string { callLog += 'int'; return 'int:' + a }
  calcStr(a: string): string { callLog += 'str'; return 'str:' + a }
  overload calc { calc, calcStr }
}

function main(): void {
  let c: Calculator = new Calculator()
  callLog = ''
  let r1: string = c.calc(42)
  if (callLog != 'int') {
    throw new Error("Expected int dispatch, got: " + callLog)
  }
  if (r1 != "int:42") {
    throw new Error("Expected int:42, got: " + r1)
  }

  callLog = ''
  let r2: string = c.calc('hello')
  if (callLog != 'str') {
    throw new Error("Expected str dispatch, got: " + callLog)
  }
  if (r2 != 'str:hello') {
    throw new Error("Expected str:hello, got: " + r2)
  }

  console.log('Instance method overload dispatch verified')
}
