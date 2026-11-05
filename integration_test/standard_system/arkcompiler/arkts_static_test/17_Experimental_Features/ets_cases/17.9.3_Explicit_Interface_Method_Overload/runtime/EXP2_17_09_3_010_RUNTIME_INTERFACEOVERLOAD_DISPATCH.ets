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
 * @id EXP2_17_09_3_010_RUNTIME_INTERFACEOVERLOAD_DISPATCH
 * @expect runtime
 * @section 17.9.3
 * @design 通过接口类型调用 overload
 * @note 运行时用例：接口引用调用 overload 验证正确分发
 */
let ifaceLog: string = ''

interface IRunner {
  runInt(a: int): string
  runStr(a: string): string
  overload run { runInt, runStr }
}

class RunnerImpl implements IRunner {
  runInt(a: int): string { ifaceLog += 'int'; return 'int:' + a }
  runStr(a: string): string { ifaceLog += 'str'; return 'str:' + a }
  overload run { runInt, runStr }
}

function main(): void {
  let r: IRunner = new RunnerImpl()
  ifaceLog = ''
  let r1: string = r.run(10)
  if (ifaceLog != 'int') {
    throw new Error("Expected int, got: " + ifaceLog)
  }
  if (r1 != "int:10") {
    throw new Error("Expected int:10, got: " + r1)
  }

  ifaceLog = ''
  let r2: string = r.run('hello')
  if (ifaceLog != 'str') {
    throw new Error("Expected str, got: " + ifaceLog)
  }
  if (r2 != 'str:hello') {
    throw new Error("Expected str:hello, got: " + r2)
  }

  console.log('Interface overload dispatch verified')
}
