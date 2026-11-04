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
 * @id CON_06_01_034_RUNTIME_RETURN_CONTEXT
 * @expect runtime
 * @section 6.1
 * @design 返回上下文运行时行为：函数返回值正确传递
 * @note 运行时用例：实际执行验证返回语义
 */
function compute(): int {
  let a: int = 10
  let b: int = 20
  return a + b
}

function getGreeting(): string {
  return 'hi'
}

function getPositive(): boolean {
  return true
}

function main(): void {
  let sum: int = compute()
  if (sum != 30) {
    throw new Error('assertion failed: compute() expected 30, got ' + sum)
  }

  let greeting: string = getGreeting()
  if (greeting != 'hi') {
    throw new Error('assertion failed: getGreeting() expected 'hi'')
  }

  let flag: boolean = getPositive()
  if (flag != true) {
    throw new Error('assertion failed: getPositive() expected true')
  }

  console.log('Return context verified')
}
