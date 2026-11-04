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
 * @id EXP_07_35_04_003_RUNTIME_LAMBDA_EVAL_INSTANCE
 * @expect runtime
 * @section 7.35.4
 * @design 验证 lambda 表达式求值产生函数类型实例且不执行体，调用时体才执行
 * @note 运行时用例：lambda 求值时不执行体，调用时体执行；返回值正确
 */
function main(): void {
  // 验证 1: lambda 定义时体不执行
  let executed: boolean = false
  const f: () => int = (): int => {
    executed = true
    return 42
  }
  if (executed != false) {
    throw new Error('assertion failed: lambda body executed during eval, flag = ' + executed)
  }

  // 验证 2: 调用 lambda 时体才执行
  let result: int = f()
  if (executed != true) {
    throw new Error('assertion failed: lambda body not executed during call')
  }
  if (result != 42) {
    throw new Error('assertion failed: expected 42, got ' + result)
  }

  // 验证 3: 多次调用产生正确返回值
  let counter: int = 10
  const g: () => int = (): int => {
    counter = counter + 1
    return counter
  }
  let r1: int = g()
  if (r1 != 11) {
    throw new Error('assertion failed: expected 11, got ' + r1)
  }
  let r2: int = g()
  if (r2 != 12) {
    throw new Error('assertion failed: expected 12, got ' + r2)
  }
  if (counter != 12) {
    throw new Error('assertion failed: expected counter=12, got ' + counter)
  }
console.log('verified')
}
