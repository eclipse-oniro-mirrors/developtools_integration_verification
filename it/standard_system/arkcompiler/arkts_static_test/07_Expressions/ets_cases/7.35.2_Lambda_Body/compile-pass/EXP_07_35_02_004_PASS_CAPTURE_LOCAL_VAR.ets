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
 * @id EXP_07_35_02_004_PASS_CAPTURE_LOCAL_VAR
 * @expect compile-pass
 * @section 7.35.2
 * @design 验证 Lambda 体捕获外围方法中的局部变量。外围局部变量在 lambda 体中使用但不声明，应被捕获
 * @note 正向用例：Lambda 可以捕获外围作用域的局部变量，包括 int/string 类型
 */
function main(): void {
  let base: int = 100
  let suffix: string = '!'

  // Lambda 捕获外围局部变量 base
  const f1: (x: int) => int = (x: int): int => x + base
  // Lambda 捕获外围局部变量 suffix
  const f2: (s: string) => string = (s: string): string => s + suffix
  // Lambda 同时捕获两个局部变量
  const f3: (n: int) => string = (n: int): string => n + ', base=' + base

  let r1: int = f1(50)
  let r2: string = f2('hello')
  let r3: string = f3(99)

  if (r1 != 150) { throw new Error('FAIL: f1(50)')
}
  if (r2 != 'hello!') { throw new Error('FAIL: f2('hello')') }
  if (r3 != '99, base=100') { throw new Error('FAIL: f3(99)')
}
console.log('verified')
}
