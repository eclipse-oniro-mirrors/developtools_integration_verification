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
 * @id EXP_07_02_05_012_RUNTIME_LAMBDA_LAZY
 * @expect runtime
 * @section 7.2.5
 * @design Lambda 表达式惰性求值：lambda 创建时体不执行，调用时才执行体
 * @note 运行时用例：验证 Lambda Expression 创建时不求值体，调用时才求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

function main(): void {
  // 创建 lambda，体不应被执行
  let f: () => int = (): int => track('BODY')
  // 此时 trace 应为 ""（lambda 体未求值）
  if (trace != '') {
    throw new Error('lambda body evaluated at creation: ' + trace)
  }

  // 调用 lambda，体应被求值
  let r: int = f()
  if (trace != 'BODY') {
    throw new Error('lambda body not evaluated at call: ' + trace)
  }
  if (r != 1) {
    throw new Error('lambda return value fail')
  }

  // 再次调用，体应再次求值
  trace = ''
  let r2: int = f()
  if (trace != 'BODY') {
    throw new Error('lambda body not re-evaluated: ' + trace)
  }

  // 多参数 lambda
  trace = ''
  let add: (a: int, b: int) => int = (a: int, b: int): int => {
    let s: int = a + b
    return s
  }
  // 创建时 trace 应为 ""
  if (trace != '') {
    throw new Error('multi-param lambda body evaluated at creation')
  }

  // 调用多参数 lambda
  let s: int = add(track('X'), track('Y'))
  if (trace != 'XY') {
    throw new Error('multi-param lambda args order fail: ' + trace)
  }
  if (s != 2) {
    throw new Error('multi-param lambda value fail')
  }
console.log('verified')
}
