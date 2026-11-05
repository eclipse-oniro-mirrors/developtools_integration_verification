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
 * @id EXP_07_02_04_006_RUNTIME_METHOD_ARGS_ORDER
 * @expect runtime
 * @section 7.2.4
 * @design 方法调用参数从左到右求值：对象方法调用中参数按左到右求值，验证 trace 顺序为 "ABC"
 * @note 运行时用例：验证方法调用参数按 A→B→C 的顺序求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

class Accumulator {
  add(a: int, b: int, c: int): int {
    if (trace != 'ABC') {
      throw new Error('method args order fail: ' + trace)
    }
    return a + b + c
  }
}

function main(): void {
  let acc: Accumulator = new Accumulator()
  let r: int = acc.add(track('A'), track('B'), track('C'))
  if (r != 3) {
    throw new Error('method args value fail')
  }
console.log('verified')
}
