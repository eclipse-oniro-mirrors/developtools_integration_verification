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
 * @id EXP_07_02_04_009_RUNTIME_NESTED_FUNC_ARGS_ORDER
 * @expect runtime
 * @section 7.2.4
 * @design 嵌套函数调用作为参数时的求值顺序：第一参数内部包含子函数调用，验证其参数表达式先于第二参数求值
 * @note 运行时用例：验证嵌套函数调用参数仍保持左到右求值顺序
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

function wrap(x: int): int {
  trace = trace + 'W'
  return x * 10
}

function test(a: int, b: int, c: int): void {
  // 到达此处时，所有参数已求值完毕
  // 期望 trace = "IWOC"（inner→wrap→outer→c）
  if (trace != 'IWOC') {
    throw new Error('nested args order fail: ' + trace)
  }
  if (a + b + c != 10 + 1 + 1) {
    throw new Error('nested args value fail')
  }
}

function main(): void {
  // 求值顺序: Arg1 wrap(track('I')) 先追加 I 再 W；Arg2 追加 O；Arg3 追加 C
  test(wrap(track('I')), track('O'), track('C'))
  console.log('verified')
}
