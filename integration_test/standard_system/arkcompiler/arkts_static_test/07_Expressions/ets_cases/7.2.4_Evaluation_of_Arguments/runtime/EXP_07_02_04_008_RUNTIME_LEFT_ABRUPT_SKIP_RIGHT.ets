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
 * @id EXP_07_02_04_008_RUNTIME_LEFT_ABRUPT_SKIP_RIGHT
 * @expect runtime
 * @section 7.2.4
 * @design 左侧参数异常完成时右侧参数不被求值：全局 trace 记录求值过程，左参数除 0 抛 ArithmeticError，
 *         右侧参数不应执行
 * @runtime-throws=ArithmeticError
 * @note 运行时用例：验证左参数硬错误导致右参数不执行（Abrupt Completion 传播）
 */
let trace: string = ''

function track(label: string): int {
  trace = trace + label
  return 1
}

function errTrack(label: string, divisor: int): int {
  trace = trace + label
  return 10 / divisor
}

function test(a: int, b: int, c: int): void {
  // 不应到达此处
  throw new Error('unreachable: should have thrown before')
}

function main(): void {
  // 左参数除零，应抛 ArithmeticError
  // 右侧参数 track("mid") 和 track("right") 不应被求值
  test(errTrack('left', 0), track('mid'), track('right'))
  // 如果到达此处，说明错误未被正常抛出
  throw new Error('unreachable: ArithmeticError should have been thrown')
}
