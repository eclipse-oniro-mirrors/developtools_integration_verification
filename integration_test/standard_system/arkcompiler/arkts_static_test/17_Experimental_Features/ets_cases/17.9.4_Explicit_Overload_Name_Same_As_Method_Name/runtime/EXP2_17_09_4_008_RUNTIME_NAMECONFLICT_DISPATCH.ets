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
 * @id EXP2_17_09_4_008_RUNTIME_NAMECONFLICT_DISPATCH
 * @expect runtime
 * @section 17.9.4
 * @design overload 名与方法同名时不产生歧义，运行时正确分发
 * @note 运行时用例：验证 overload 名与方法同名时的运行时行为
 */
let nameConflictLog: string = ''

class Op {
  execute(a: int): string { nameConflictLog += 'int'; return 'exe-int:' + a }
  executeStr(a: string): string { nameConflictLog += 'str'; return 'exe-str:' + a }
  overload execute { execute, executeStr }
}

function main(): void {
  let op: Op = new Op()
  nameConflictLog = ''
  let r1: string = op.execute(10)
  if (nameConflictLog != 'int') {
    throw new Error("Expected int dispatch, got: " + nameConflictLog)
  }
  if (r1 != "exe-int:10") {
    throw new Error("Expected exe-int:10, got: " + r1)
  }

  nameConflictLog = ''
  let r2: string = op.execute('test')
  if (nameConflictLog != 'str') {
    throw new Error("Expected str dispatch, got: " + nameConflictLog)
  }
  if (r2 != 'exe-str:test') {
    throw new Error("Expected exe-str:test, got: " + r2)
  }

  console.log('Name-same overload dispatch verified')
}
