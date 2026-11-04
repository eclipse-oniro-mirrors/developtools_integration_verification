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
 * @id EXP2_17_09_2_018_RUNTIME_METHODOVERLOAD_STATICDISPATCH
 * @expect runtime
 * @section 17.9.2
 * @design static overload 运行时调度
 * @note 运行时用例：通过类名调用 static overload
 */
let staticCallLog: string = ''

class StaticCalc {
  static doWork(a: int): string { staticCallLog += 'int'; return 'int:' + a }
  static doWorkStr(a: string): string { staticCallLog += 'str'; return 'str:' + a }
  static overload doWork { doWork, doWorkStr }
}

function main(): void {
  staticCallLog = ''
  let r1: string = StaticCalc.doWork(100)
  if (staticCallLog != 'int') {
    throw new Error("Expected int dispatch, got: " + staticCallLog)
  }
  if (r1 != "int:100") {
    throw new Error("Expected int:100, got: " + r1)
  }

  staticCallLog = ''
  let r2: string = StaticCalc.doWork('test')
  if (staticCallLog != 'str') {
    throw new Error("Expected str dispatch, got: " + staticCallLog)
  }
  if (r2 != 'str:test') {
    throw new Error("Expected str:test, got: " + r2)
  }

  console.log('Static method overload dispatch verified')
}
