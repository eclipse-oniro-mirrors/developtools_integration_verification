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
 * @id EXP_07_35_01_006_PASS_GENERIC_LAMBDA_INFERENCE
 * @expect compile-pass
 * @section 7.35.1
 * @design 验证泛型函数上下文中 Lambda 参数类型的推断：泛型类型参数 T 为 Lambda 提供参数类型上下文
 * @note 正向用例：验证泛型函数调用时 Lambda 参数类型从泛型约束中推断
 */

// 泛型函数：接受一个函数类型参数，参数类型由泛型 T 决定
function apply<T>(p: (val: T) => T, val: T): T {
  return p(val)
}

// 泛型函数接受两个参数
function combine<T, U>(p: (a: T, b: U) => string, a: T, b: U): string {
  return p(a, b)
}

function main(): void {
  // 从泛型函数调用上下文推断参数类型
  const r1: int = apply <int> ((e) => e * 2, 5)
  const r2: string = apply <string> ((e) => e + '!', 'hello')
  const r3: boolean = apply <boolean> ((e) => !e, false)
  const r4: double = apply <double> ((e) => e * 1.5, 10.0)

  // Lambda 中省略类型，由泛型提供
  const r5: string = combine <int, int> ((a, b) => '' + a + b, 1, 2)

  // 验证实际调用值正确
  if (r1 != 10) {
    throw new Error('FAIL: apply<int>')
  }
  if (r2 != 'hello!') {
    throw new Error('FAIL: apply<string>')
  }
  if (r3 != true) {
    throw new Error('FAIL: apply<boolean>')
  }
  if (r4 != 15.0) {
    throw new Error('FAIL: apply<double>')
  }
  if (r5 != '12') {
    throw new Error('FAIL: combine')
  }
console.log('verified')
}
