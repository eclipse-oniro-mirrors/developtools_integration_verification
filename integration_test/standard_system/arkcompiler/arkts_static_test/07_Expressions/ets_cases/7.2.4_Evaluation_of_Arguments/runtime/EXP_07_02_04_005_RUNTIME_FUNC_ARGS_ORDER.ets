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
 * @id EXP_07_02_04_005_RUNTIME_FUNC_ARGS_ORDER
 * @expect runtime
 * @section 7.2.4
 * @design 函数调用参数从左到右求值：全局 trace 变量记录每个参数表达式的求值顺序，验证左到右语义
 * @note 运行时用例：验证函数调用参数按 L→M→R 的顺序求值
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

function test(a: int, b: int, c: int): void {
  if (trace != 'LMR') {
    throw new Error('func args order fail: ' + trace)
  }
  if (a + b + c != 3) {
    throw new Error('func args value fail')
  }
}

function main(): void {
  test(track('L'), track('M'), track('R'))
  console.log('verified')
}
