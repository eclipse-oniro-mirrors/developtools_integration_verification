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
 * @id EXP2_17_09_008_RUNTIME_OVERLOAD_ORDERRESOLUTION
 * @expect runtime
 * @section 17.9
 * @design overload 在运行时按声明顺序解析
 * @note 运行时用例：验证运行时重载解析（编译时已固定）
 */
let overviewLog: string = ''

function fnOne(a: int): string { overviewLog += '1'; return 'one:' + a }
function fnTwo(a: double): string { overviewLog += '2'; return 'two:' + a }
function fnThree(a: string): string { overviewLog += '3'; return 'three:' + a }
overload multi { fnOne, fnTwo, fnThree }

function main(): void {
  overviewLog = ''
  let r1: string = multi(100)
  if (overviewLog != '1') { throw new Error("Expected fnOne, got: " + overviewLog) }

  overviewLog = ''
  let r2: string = multi(3.14)
  if (overviewLog != '2') { throw new Error("Expected fnTwo, got: " + overviewLog) }

  overviewLog = ''
  let r3: string = multi('hello')
  if (overviewLog != '3') { throw new Error("Expected fnThree, got: " + overviewLog) }

  console.log('Overview overload order resolution verified')
}
