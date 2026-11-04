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
 * @id EXP2_17_09_5_012_RUNTIME_CTOROVERLOAD_RESOLUTION
 * @expect runtime
 * @section 17.9.5
 * @design constructor overload 运行时解析到正确构造函数
 * @note 运行时用例：验证 new 表达式调用正确的命名构造函数
 */
let ctorLog2: string = ''

class Logger2 {
  private label: string
  constructor emptyCtor() { ctorLog2 += 'default'; this.label = 'default' }
  constructor fromInt(v: int) { ctorLog2 += 'int'; this.label = "int:" + v }
  constructor fromStr(v: string) { ctorLog2 += 'str'; this.label = "str:" + v }
  constructor fromDbl(v: double) { ctorLog2 += 'dbl'; this.label = "dbl:" + v }
  overload constructor { emptyCtor, fromInt, fromStr, fromDbl }
  getLabel(): string { return this.label }
}

function main(): void {
  // Use named constructors via new expression
  ctorLog2 = ''
  let obj1: Logger2 = new Logger2()
  if (ctorLog2 != 'default') {
    throw new Error("Expected default ctor, got: " + ctorLog2)
  }

  ctorLog2 = ''
  let obj2: Logger2 = new Logger2(42)
  if (ctorLog2 != 'int') {
    throw new Error("Expected int ctor, got: " + ctorLog2)
  }

  ctorLog2 = ''
  let obj3: Logger2 = new Logger2('hello')
  if (ctorLog2 != 'str') {
    throw new Error("Expected str ctor, got: " + ctorLog2)
  }

  ctorLog2 = ''
  let obj4: Logger2 = new Logger2(3.14)
  if (ctorLog2 != 'dbl') {
    throw new Error("Expected dbl ctor, got: " + ctorLog2)
  }

  console.log('Constructor overload resolution verified')
}
