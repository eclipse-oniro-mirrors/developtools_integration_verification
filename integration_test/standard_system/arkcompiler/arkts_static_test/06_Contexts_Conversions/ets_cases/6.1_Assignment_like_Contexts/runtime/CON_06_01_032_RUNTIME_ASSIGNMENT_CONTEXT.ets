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
 * @id CON_06_01_032_RUNTIME_ASSIGNMENT_CONTEXT
 * @expect runtime
 * @section 6.1
 * @design 赋值上下文运行时行为：变量赋值后读取值应为赋值后的新值
 * @note 运行时用例：实际执行验证赋值语义
 */
function main(): void {
  let x: int = 10
  if (x != 10) {
    throw new Error('assertion failed: initial x expected 10')
  }

  x = 20
  if (x != 20) {
    throw new Error('assertion failed: x after assignment expected 20, got ' + x)
  }

  x = -5
  if (x != -5) {
    throw new Error('assertion failed: x after second assignment expected -5, got ' + x)
  }

  let s: string = 'first'
  s = 'second'
  if (s != 'second') {
    throw new Error('assertion failed: s expected 'second', got ' + s)
  }

  console.log('Assignment context verified')
}
