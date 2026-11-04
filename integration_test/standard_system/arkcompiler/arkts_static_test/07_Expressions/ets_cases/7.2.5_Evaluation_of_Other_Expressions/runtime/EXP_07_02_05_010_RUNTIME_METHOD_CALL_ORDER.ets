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
 * @id EXP_07_02_05_010_RUNTIME_METHOD_CALL_ORDER
 * @expect runtime
 * @section 7.2.5
 * @design 方法调用表达式中对象先于参数求值：obj.method(arg) 中 obj 先求值再求 arg
 * @note 运行时用例：验证 Method Call Expression 中接收者对象先于参数求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

class Holder {
  public val: int

  constructor(v: int) {
    this.val = v
  }

  add(x: int): int {
    if (trace != 'OA') {
      throw new Error('method call order fail: ' + trace)
    }
    return this.val + x
  }
}

function getObj(label: string): Holder {
  trace = trace + label
  return new Holder(10)
}

function getArg(label: string): int {
  trace = trace + label
  return 5
}

function main(): void {
  // getObj("O") 先求值（接收者），然后 getArg("A") 求值（参数）
  // trace 应为 "OA"
  let r: int = getObj('O').add(getArg('A'))
  if (trace != 'OA') {
    throw new Error('method call trace fail: ' + trace)
  }
  if (r != 15) {
    throw new Error('method call value fail')
  }
console.log('verified')
}
