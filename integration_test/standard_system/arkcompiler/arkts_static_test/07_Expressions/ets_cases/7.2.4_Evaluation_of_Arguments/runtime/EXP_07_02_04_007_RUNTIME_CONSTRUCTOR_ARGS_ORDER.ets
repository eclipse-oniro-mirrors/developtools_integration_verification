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
 * @id EXP_07_02_04_007_RUNTIME_CONSTRUCTOR_ARGS_ORDER
 * @expect runtime
 * @section 7.2.4
 * @design 构造函数(new)调用参数从左到右求值：new 表达式中参数按左到右求值，验证 trace 顺序为 "XYZ"
 * @note 运行时用例：验证构造函数调用参数按 X→Y→Z 的顺序求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

class Triple {
  public a: int
  public b: int
  public c: int

  constructor(a: int, b: int, c: int) {
    if (trace != 'XYZ') {
      throw new Error('constructor args order fail: ' + trace)
    }
    this.a = a
    this.b = b
    this.c = c
  }
}

function main(): void {
  let t: Triple = new Triple(track('X'), track('Y'), track('Z'))
  if (t.a + t.b + t.c != 3) {
    throw new Error('constructor args value fail')
  }
console.log('verified')
}
